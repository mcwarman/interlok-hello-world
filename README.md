# interlok-hello-world [![Build Status](https://travis-ci.org/mcwarman/interlok-hello-world.svg?branch=master)](https://travis-ci.org/adaptris-labs/interlok-hello-world) [![Docker Build Status](https://img.shields.io/docker/pulls/adaptrislabs/interlok-hello-world.svg)](https://hub.docker.com/r/adaptrislabs/interlok-hello-world/) [![Heroku Build Status](https://heroku-badge.herokuapp.com/?app=interlok-hello-world&svg=1)](https://interlok-hello-world.herokuapp.com/)

Docker image that provides the classic programming example: "Hello World".

```
$ docker run -d --rm -p 8081:8081 -e PORT=8081 adaptrislabs/interlok-hello-world
$ curl -s http://localhost:8081/
Hello World!
```
