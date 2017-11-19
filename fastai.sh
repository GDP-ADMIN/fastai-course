#!/bin/bash

case $1 in
    build)
        docker build -t fastai-course .
    ;;
    enter)
        docker exec -it fastai-course bash
    ;;
    up)
        docker stop fastai-course >/dev/null 2>&1 || :
        docker rm fastai-course >/dev/null 2>&1 || :
        docker run -d --name fastai-course \
            --runtime=nvidia \
            -e PASSWORD=$PASSWORD \
            -p 8888:8888 \
            -p 6006:6006 \
            -v $(pwd)/nbs:/notebooks/nbs \
            fastai-course
    ;;
    *)
        echo "Usage: $0 (build|enter|up)"
        exit 1
    ;;
esac
