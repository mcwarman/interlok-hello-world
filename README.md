# interlok-hello-world [![Build Status](https://travis-ci.org/mcwarman/interlok-hello-world.svg?branch=master)](https://travis-ci.org/mcwarman/interlok-hello-world) [![Docker Build Status](https://img.shields.io/docker/pulls/mcwarman/interlok-hello-world.svg)](https://hub.docker.com/r/mcwarman/interlok-hello-world/) [![Heroku Build Status](https://heroku-badge.herokuapp.com/?app=interlok-hello-world&svg=1)](https://interlok-hello-world.herokuapp.com/)

Docker image that provides the classic programming example: "Hello World".

```
$ docker run -d --rm -p 8080:8080 mcwarman/interlok-hello-world
$ curl -s http://localhost:8080/
Hello World!
```
