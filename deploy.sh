#!/bin/bash
set -e
if [ "$TRAVIS_BRANCH" = 'master' ] && [ "$TRAVIS_PULL_REQUEST" == 'false' ]; then
  echo "Deploying to Docker Hub"
  echo "$DOCKER_PASS" | docker login --u "$DOCKER_USER" --password-stdin;
  docker push $REPO:latest;
  docker logout;
  echo "Deployment to Docker Hub Complete"
  echo "Deploying to Heroku"
  docker login --username=_ --password=$HEROKU_PASS registry.heroku.com;
  docker tag $REPO:latest registry.heroku.com/$HEROKU_APP/web:latest;
  docker push registry.heroku.com/$HEROKU_APP/web:latest;
  docker logout registry.heroku.com;
  echo "Deployment to Heroku Complete"
fi
