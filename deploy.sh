#!/bin/bash
set -e
if [ "$TRAVIS_BRANCH" = 'master' ] && [ "$TRAVIS_PULL_REQUEST" == 'false' ]; then
  echo "Initiating Docker Hub Build"
  curl -w "\n" -s -H "Content-Type: application/json" --data "{\"source_type\": \"Branch\", \"source_name\": \"$TRAVIS_BRANCH\"}" -X POST "https://registry.hub.docker.com/u/mcwarman/interlok-hello-world/trigger/$DOCKER_HUB_TOKEN/"
  echo "Initiated Docker Hub Build"
#  echo "Deploying to Heroku"
#  docker login --username=_ --password=$HEROKU_PASS registry.heroku.com;
#  docker tag $REPO:$TRAVIS_BUILD_NUMBER registry.heroku.com/$HEROKU_APP/web:latest;
#  docker push registry.heroku.com/$HEROKU_APP/web:latest;
#  docker logout registry.heroku.com;
#  echo "Deployment to Heroku Complete"
fi
