#!/bin/bash
set -e
if [ "$TRAVIS_BRANCH" = 'master' ] && [ "$TRAVIS_PULL_REQUEST" == 'false' ]; then
  docker login --username=$DOCKER_USER --password=$DOCKER_PASS;
  docker tag $REPO:$TRAVIS_BUILD_NUMBER $REPO:latest;
  docker push $REPO:latest;
  docker logout;
  docker login --username=_ --password=$HEROKU_PASS registry.heroku.com;
  docker tag $REPO:$TRAVIS_BUILD_NUMBER $HEROKU_REPO:latest;
  docker push $HEROKU_REPO:latest;
  docker logout registry.heroku.com;
fi