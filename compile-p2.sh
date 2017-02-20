#!/usr/bin/env bash
#
# script to start influxdb and compile influxdb-java with all tests.
#
set -e
set -x

docker run -it --rm  \
       --volume $PWD:/usr/src/mymaven \
       --volume $PWD/.m2:/root/.m2 \
       --workdir /usr/src/mymaven \
       maven:alpine mvn clean install -DskipTests=true

docker run -it --rm  \
       --volume $PWD/repository:/usr/src/mymaven \
       --volume $PWD/.m2:/root/.m2 \
       --workdir /usr/src/mymaven \
       maven:alpine mvn clean p2:site


