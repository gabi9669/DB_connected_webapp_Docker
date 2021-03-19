#!/bin/bash

#install docker and docker-compose
if ! command -v docker &> /dev/null
then
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh
    sudo usermod -aG docker vagrant
fi

echo "Docker installed"

if ! command -v docker-compose &> /dev/null
then
    sudo curl -L "https://github.com/docker/compose/releases/download/1.28.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
fi

mkdir containers

cd ./containers

sudo yes | cp -rf /vagrant/chinook_data.sql ./
sudo yes | cp -rf /vagrant/Dockerfile ./
sudo yes | cp -rf /vagrant/docker-compose.yml ./
sudo yes | cp -rf /vagrant/web.war ./

sudo docker build -t tomcatweb:v1 .

sudo docker-compose up -d
