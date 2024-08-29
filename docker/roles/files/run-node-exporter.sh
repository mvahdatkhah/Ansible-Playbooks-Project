#!/bin/sh
set -x
sudo docker rm --force node_exporter
sudo docker run -d \
    --name node_exporter \
    -p 9100:9100 \
    --net="host" \
    -m 400M \
    --memory-swap 1G \
    --cpuset-cpus="0,1" \
    --restart always \
    --pid="host" \
    -v "/:/host:ro,rslave" \
    quay.io/prometheus/node-exporter:latest \
    --path.rootfs=/host
