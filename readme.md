# docker-golangweb-simple

Simple golang web site using run on KUBERNETES or RANCHER and other docker management platforms.

## DOCKERHUB

[![dockeri.co](http://dockeri.co/image/dmportella/golangweb-simple)](https://hub.docker.com/r/dmportella/golangweb-simple/)

## GOLANGWEB SIMPLE

Simple Hello World golang site.

Built for testing *kubernetes* and *rancher* instances.

### Normal route

Web site should be available on binding `:8080`.

## Building

The shell file `build.sh` will run npm install, install and run grunt and it will build and run the docker image.

> $ `./build.sh`

Builds docker image and tags it.

> $ `./build-image.sh`

* Installs godep and other setup things

> $ `./setup.sh`

## ENVIRONMENT

`BINDING` default = `:8080`