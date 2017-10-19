#!/bin/bash
curl -H "Content-Type: application/json" --data "{\"source_type\": \"Branch\", \"source_name\": \"$TRAVIS_BRANCH\"}" -X POST "https://registry.hub.docker.com/u/mcwarman/interlok-hello-world/trigger/$DOCKER_HUB_TOKEN/"
