#!/usr/bin/env bash
if [ "$TRAVIS_PULL_REQUEST" == "false" ]; then
    echo "Not a Pull Request. Skipping surge deployment"
    exit 0
fi
echo "PR deployment start --"
export DEPLOY_DOMAIN=https://pr-${TRAVIS_PULL_REQUEST}-numpy.surge.sh
echo "Deployment domain -- "
echo $DEPLOY_DOMAIN

surge --project ./docs/build/html --domain $DEPLOY_DOMAIN --token $SURGE_TOKEN
