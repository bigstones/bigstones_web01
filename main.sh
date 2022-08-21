#!/bin/bash

sudo apt-get remove docker docker-engine docker.io containerd runc

sudo apt-get update

sudo apt-get -y install \
ca-certificates \
curl \
gnupg \
lsb-release

sudo mkdir -p /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update

sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin

sudo docker pull python:3.8.13-alpine3.16

DIR="$( cd "$( dirname "$0" )" && pwd -P )"
cd $DIR
sudo docker-compose up -d build
