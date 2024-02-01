#!/bin/bash

set -e

./mvnw spring-boot:build-image -DskipTests

IMAGE="docker.io/library/selfsigned:0.0.1-SNAPSHOT"
PROBE="container CA certificates to JVM truststore"

WITH_CERTS=$(docker run -it --rm \
  --env SERVICE_BINDING_ROOT=/bindings \
  --volume "$(pwd)/config/bindings:/bindings" \
  $IMAGE | grep -i "$PROBE")


WITHOUT_CERTS=$(docker run -it --rm $IMAGE | grep -i "$PROBE")

if [ "$WITH_CERTS" == "$WITHOUT_CERTS" ]; then
  echo "Expect \"$WITH_CERTS\" to be different than \"$WITHOUT_CERTS\""
  echo "Test failed"
  exit 1
else
  echo "Test passed"
fi
