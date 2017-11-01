#! /bin/sh
set -e

export JAVA_OPTS=${JAVA_OPTS:="-Djetty.http.port=$PORT -Dsun.net.inetaddr.ttl=3600"}
export JVM_ARGS=${JVM_ARGS:="-Xmx256m"}

exec /docker-entrypoint.sh
