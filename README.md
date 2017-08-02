# interlok-hello-world

Docker image that provides the classic programming example: "Hello World".

```
$ docker run -d --rm -p 8080:8080 mcwarman/interlok-hello-world
$ curl -s http://localhost:8080/
Hello World!
```