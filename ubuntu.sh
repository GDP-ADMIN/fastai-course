#!/bin/bash

sudo apt-get update
sudo apt-get -y upgrade

# Install nvidia cuda
wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_9.0.176-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1604_9.0.176-1_amd64.deb

# Install docker-ce and nvidia-docker2
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey |   sudo apt-key add -
curl -s -L https://nvidia.github.io/nvidia-docker/ubuntu16.04/amd64/nvidia-docker.list |   sudo tee /etc/apt/sources.list.d/nvidia-docker.list
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-get update
sudo apt-get install -y docker-ce=17.09.0~ce-0~ubuntu nvidia-docker2=2.0.1+docker17.09.0-1
sudo service docker reload # Docker engine need to be reloaded so it recognize nvidia runtime
sudo sudo curl -L https://github.com/docker/compose/releases/download/1.17.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
