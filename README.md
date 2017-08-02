# interlok-hello-world [![Docker Build Status](https://img.shields.io/docker/build/mcwarman/interlok-hello-world.svg)](https://hub.docker.com/r/mcwarman/interlok-hello-world/)

Docker image that provides the classic programming example: "Hello World".

```
$ docker run -d --rm -p 8080:8080 mcwarman/interlok-hello-world
$ curl -s http://localhost:8080/
Hello World!
```
