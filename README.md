# Dockerized Fast AI Course Env
This repository consists of scripts and Dockerfile to setup an environment necessary to follow machine learning course from http://course.fast.ai.
It is tested on AWS GPU instance (p2.xlarge) using Ubuntu 16.04 OS.

## How to Use
The only requirement is an Ubuntu 16.04 OS with GPU.
1. Clone this repo and move to repo directory, `git clone https://github.com/GDP-ADMIN/fastai-course && cd fastai-course`.
2. Run ubuntu.sh (`./ubuntu.sh`) script to install NVidia cuda, docker-ce, and nvidia-docker2.
3. Close current terminal and open a new terminal. This is necessary so you can run docker command without sudo.
4. Build docker image, `./fastai.sh build`
5. Create docker container to start fastai env, `PASSWORD=$PASSWORD ./fastai.sh up`. Change the $PASSWORD variable to something random since it is used as password when accessing jupyter notebook. Open http://[machine ip]:8888/ from your browser to visit jupyter notebook.


The `./fastai.sh up` command binds mount **nbs** directory from host to container.
I suggest to save your notebook file under nbs directory.

# Clean Up
Before deleting the instance, i suggest to copy **nbs** directory to other location.
