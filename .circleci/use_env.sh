#!/bin/sh

if [[ "$CIRCLE_BRANCH" != "main" && -n "$CIRCLE_PULL_REQUEST" ]]; then
    echo 'export CONFIG_PATH=.circleci/pre-main.yml' >> $BASH_ENV
    echo "Running pre-check before merging to main!"
elif [ "$CIRCLE_BRANCH" = "production" ]; then
    echo 'export CONFIG_PATH=.circleci/production.yml' >> $BASH_ENV
    echo "Using production config"
else
    echo 'export CONFIG_PATH=.circleci/pre-checks.yml' >> $BASH_ENV
    echo "Using pre-checks config"
fi
