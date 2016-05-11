#!/bin/bash
echo "CI: " $CI "TRAVIS: " $TRAVIS "TRAVIS_TAG: " $TRAVIS_TAG

echo "settting up"
./setup.sh

echo "testing"
go test

echo "golang build"
go build -o golangweb-simple .

echo "building docker image"
VERSION="$1"
if [ -z "$1" ]
  then
    VERSION=0.0.0
fi
echo "version: " ${VERSION}
./build-image.sh "${VERSION}"

if [ -z "$TRAVIS" ]; then
	TAG="${VERSION}"
	IMAGE=dmportella/golangweb-simple:${TAG}

	echo "running container image:" ${IMAGE}
	
	docker run -it --rm --name golangweb-simple --publish 8080:8080 ${IMAGE}

	echo "deleting image"
	docker rmi ${IMAGE}
fi

echo "DONE"
