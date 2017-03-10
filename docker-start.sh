DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

docker kill influxdb || true
docker rm influxdb || true
docker run \
       --detach \
       --name influxdb \
       --publish 8086:8086 \
       --publish 8089:8089/udp \
       --volume ${DIR}/influxdb.conf:/etc/influxdb/influxdb.conf \
       influxdb:1.2-alpine
