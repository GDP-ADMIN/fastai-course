#!/bin/bash
set -e

# Setup cuda apt repository
wget -nc http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_9.0.176-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1604_9.0.176-1_amd64.deb
sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub

# Setup docker-ce and nvidia-docker2 apt repository
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey |   sudo apt-key add -
curl -s -L https://nvidia.github.io/nvidia-docker/ubuntu16.04/amd64/nvidia-docker.list |   sudo tee /etc/apt/sources.list.d/nvidia-docker.list
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update
sudo apt-get install -y cuda-8-0 \
    docker-ce=17.09.0~ce-0~ubuntu \
    nvidia-container-runtime=1.1.0+docker17.09.0-1 \
    nvidia-docker2=2.0.1+docker17.09.0-1

sudo service docker reload # Docker engine need to be reloaded so it recognize nvidia runtime
sudo usermod -aG docker $USER
