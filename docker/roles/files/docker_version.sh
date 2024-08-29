#!/bin/bash

dockerStatus=$(systemctl status docker | awk '/Active/ { print $3 }' | tr -d "[()]")
dockerVersion=$(docker -v | awk '/version/ { print $3 }' | tr -d ",")
dockerComposeVersion=$(docker-compose --version | awk '/version/ { print $4 }' | tr -d ",")
dockerContainers=$(sudo docker ps)

echo "The Docker Status is: $dockerStatus"
echo "The Docker Version is: $dockerVersion"
echo "The Docker Composer Version is: $dockerComposeVersion"
echo "The Docker Containers are: $dockerContainers"

