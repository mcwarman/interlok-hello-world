#!/bin/bash
set -euxo pipefail
if [ "$TRAVIS_BRANCH" = 'master' ] && [ "$TRAVIS_PULL_REQUEST" == 'false' ]; then
  echo "Deploying to Docker Hub"
  echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin;
  docker push $REPO:latest;
  docker logout;
  echo "Deployment to Docker Hub Complete"
  echo "Deploying to Heroku"
  echo "$HEROKU_PASS" | docker login -u "_" --password-stdin registry.heroku.com;
  docker tag $REPO:latest registry.heroku.com/$HEROKU_APP/web:latest;
  docker push registry.heroku.com/$HEROKU_APP/web:latest;
  docker logout registry.heroku.com;
  HEROKU_WEB_DOCKER_IMAGE_ID=$(docker inspect registry.heroku.com/$HEROKU_APP/web:latest --format={{.Id}})
  curl -n -X PATCH https://api.heroku.com/apps/$HEROKU_APP/formation \
    -d "{ \"updates\": [ { \"type\": \"web\", \"docker_image\": \"$HEROKU_WEB_DOCKER_IMAGE_ID\" } ] }" \
    -H "Content-Type: application/json" \
    -H "Accept: application/vnd.heroku+json; version=3.docker-releases"\
    -H "Authorization: Bearer $HEROKU_PASS";
  echo "Deployment to Heroku Complete";
  echo "Update to GitHub Environemnts";
  GIT_DEPLOYMENT_URL=$(curl -si -X POST \
    -d "{ \"ref\": \"$TRAVIS_COMMIT\", \"description\": \"Heroku\", \"environment\": \"$HEROKU_APP\", \"required_contexts\" : [] }" \
    -H 'Accept: application/vnd.github.v3+json' \
    -H "Authorization: token $GITHUB_TOKEN" \
    -H 'Content-Type: application/json' \
    "https://api.github.com/repos/$TRAVIS_REPO_SLUG/deployments" | grep -oP 'Location: \K[^\s]+');
  curl -s -X POST \
    -d "{ \"state\": \"success\", \"log_url\": \"https://dashboard.heroku.com/apps/$HEROKU_APP\", \"environment_url\" : \"$HEROKU_URL\"}" \
    -H 'Accept: application/vnd.github.ant-man-preview+json' \
    -H "Authorization: token $GITHUB_TOKEN" \
    -H 'Content-Type: application/json' \
    "$GIT_DEPLOYMENT_URL/statuses";
  echo "Updated to GitHub Environemnts";
fi
