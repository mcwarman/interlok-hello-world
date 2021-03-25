# interlok-hello-world [![Publish](https://github.com/adaptris-labs/interlok-hello-world/actions/workflows/publish.yaml/badge.svg)](https://github.com/adaptris-labs/interlok-hello-world/actions/workflows/publish.yaml) [![Code Smells](https://sonarcloud.io/api/project_badges/measure?project=adaptris-labs_interlok-hello-world&metric=code_smells)](https://sonarcloud.io/dashboard?id=adaptris-labs_interlok-hello-world) [![Docker Pulls Status](https://img.shields.io/docker/pulls/adaptrislabs/interlok-hello-world.svg)](https://hub.docker.com/r/adaptrislabs/interlok-hello-world/) [![Heroku](https://img.shields.io/badge/heroku-deployed-blueviolet)](https://interlok-hello-world.herokuapp.com/)

Docker image that provides the classic programming example: "Hello World".

```shell
$ docker run -d --rm -p 8081:8081 -e PORT=8081 adaptrislabs/interlok-hello-world
$ curl -s http://localhost:8081/
Hello World!
```
