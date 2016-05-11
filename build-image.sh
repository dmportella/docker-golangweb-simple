#!/bin/bash

if [[ $# -eq 0 ]] ; then
    echo 'Missing version'
    exit 1
fi

REPO=dmportella/golangweb-simple
TAG="$1"
IMAGE=${REPO}:${TAG}

echo "docker build -t ${IMAGE} ."
docker build --build-arg CONT_IMG_VER=${TAG} -t ${IMAGE} . > docker-build.log

IMAGE_ID=$(grep 'Successfully built' docker-build.log | awk '{print $3}')

echo "Tagging latest" ${IMAGE_ID} 

echo "docker tag ${IMAGE_ID} ${REPO}:latest"
docker tag ${IMAGE_ID} ${REPO}:latest

echo "done building" ${IMAGE}