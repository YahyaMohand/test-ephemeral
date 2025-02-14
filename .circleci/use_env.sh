#!/bin/sh

if [[ "$CIRCLE_BRANCH" != "main" && -n "$CIRCLE_PULL_REQUEST" ]]; then
    echo 'export CONFIG_PATH=.circleci/config.yml' >> $BASH_ENV
    echo "Starting PR workflow chain!"
elif [ "$CIRCLE_BRANCH" = "production" ]; then
    echo 'export CONFIG_PATH=.circleci/production.yml' >> $BASH_ENV
    echo "Using production config"
else
    echo 'export CONFIG_PATH=.circleci/pre-checks.yml' >> $BASH_ENV
    echo "Using pre-checks config"
fi