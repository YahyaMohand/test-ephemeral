#!/bin/bash

set -e

# Define Variables
PR_NUMBER=$(basename ${CIRCLE_PULL_REQUEST##*/})
PR_BRANCH=${CIRCLE_BRANCH}
EPHEMERAL_REPO="https://github.com/YahyaMohand/ephemeral.git"
TF_DIR="ephemeral/terraform/ephemeral"
AWS_REGION="me-south-1"
INSTANCE_NAME="digitalzone-testing-bastion"
DB_CLUSTER_IDENTIFIER="digitalzone-testing-db"

# Function to setup ephemeral repository
setup_ephemeral_repo() {
    echo "Cloning the ephemeral Terraform repository..."
    rm -rf ephemeral
    git clone $EPHEMERAL_REPO
    ls -la $TF_DIR
}

# Function to initialize Terraform
terraform_init() {
    setup_ephemeral_repo
    echo "Initializing Terraform..."
    cd $TF_DIR
    terraform init -backend-config="key=ephemeral-environments/pr-$PR_NUMBER/terraform.tfstate"
}

# Function to execute Terraform Plan
terraform_plan() {
    echo "Running Terraform Plan..."
    # cd $TF_DIR
    terraform plan -var-file="terraform.ephemeral.tfvars" -var="pr_number=$PR_NUMBER" -var="is_backend=true" -out=tfplan
}

# Function to destroy Terraform resources
terraform_destroy() {
    echo "Destroying Terraform Resources..."
    cd $TF_DIR
    terraform destroy -auto-approve -var-file="terraform.ephemeral.tfvars" -var="pr_number=$PR_NUMBER" -var="is_backend=true"
}

# Function to setup AWS tools
setup_db_tools() {
    echo "Installing required tools..."
    apt update && apt install -y curl unzip postgresql-client
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    ./aws/install
    aws --version
    curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/ubuntu_64bit/session-manager-plugin.deb" -o "session-manager-plugin.deb"
    apt install -y ./session-manager-plugin.deb
    session-manager-plugin --version
    psql --version
    npm install -g prisma
    prisma -v
}

# Function to manage database schema
manage_schema() {
    ACTION=$1
    setup_db_tools
    echo "Setting up AWS SSM Tunnel..."

    INSTANCE_ID=$(aws ec2 describe-instances --region $AWS_REGION \
        --filters "Name=tag:Name,Values=$INSTANCE_NAME" \
        --query "Reservations[*].Instances[*].InstanceId" \
        --output text)

    DB_HOST=$(aws rds describe-db-clusters --region $AWS_REGION \
        --db-cluster-identifier $DB_CLUSTER_IDENTIFIER \
        --query 'DBClusters[*].Endpoint' --output text)

    START_SESSION=$(aws ssm start-session --region $AWS_REGION --target $INSTANCE_ID \
        --document-name AWS-StartPortForwardingSessionToRemoteHost \
        --parameters "{\"portNumber\":[\"5432\"],\"localPortNumber\":[\"5432\"],\"host\":[\"$DB_HOST\"]}" \
        --query 'SessionId' --output text) &

    sleep 10

    SESSION_ID=$(aws ssm describe-sessions --region $AWS_REGION --state Active \
        --filter "key=Target, value=$INSTANCE_ID" --query "Sessions[0].SessionId" --output text)

    echo $SESSION_ID >/tmp/ssm_session_id

    if [ "$ACTION" == "create" ]; then
        echo "Creating schema pr_$PR_NUMBER..."
        PGPASSWORD="$DB_PASSWORD" psql -h localhost -p 5432 -U $DB_USER -d $DB_NAME \
            -c "CREATE SCHEMA IF NOT EXISTS pr_$PR_NUMBER;"
    elif [ "$ACTION" == "drop" ]; then
        echo "Dropping schema pr_$PR_NUMBER..."
        PGPASSWORD="$DB_PASSWORD" psql -h localhost -p 5432 -U $DB_USER -d $DB_NAME \
            -c "DROP SCHEMA IF EXISTS pr_$PR_NUMBER CASCADE;"
    fi

    echo "Terminating SSM Session..."
    AWS_PAGER="" aws ssm terminate-session --session-id $SESSION_ID --region $AWS_REGION
}

# Main script execution
case "$1" in
"plan")
    terraform_init
    terraform_plan
    ;;
"create-schema")
    manage_schema "create"
    ;;
"destroy")
    terraform_init
    terraform_destroy
    ;;
"drop-schema")
    manage_schema "drop"
    ;;
*)
    echo "Usage: $0 {plan|create-schema|destroy|drop-schema}"
    exit 1
    ;;
esac
