#!/bin/sh

if [ "$CIRCLE_BRANCH" = "main" ]; then
    echo 'export CONFIG_PATH=.circleci/staging.yml' >> $BASH_ENV
elif [ "$CIRCLE_BRANCH" = "production" ]; then
    echo 'export CONFIG_PATH=.circleci/production.yml' >> $BASH_ENV
else
    echo 'export CONFIG_PATH=.circleci/pre-checks.yml' >> $BASH_ENV
fi