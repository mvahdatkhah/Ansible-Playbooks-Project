#!/bin/sh
set -x
systemctl stop docker
sudo yum remove -y docker \
	docker-ce \
	docker-ce-cli \
        docker-client \
        docker-client-latest \
        docker-common \
        docker-latest \
        docker-latest-logrotate \
        docker-logrotate \
        docker-engine

sudo yum autoremove -y
[ -e /var/lib/docker ] && sudo rm -rf /var/lib/docker
[ -e /var/lib/containerd ] && sudo rm -rf /var/lib/containerd
[ -e /etc/docker ] && sudo rm -rf /etc/docker
