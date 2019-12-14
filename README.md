# Docker image for building C++ projects
- [Docker](http://www.docker.com/) build image based on CentOS v8, includes:
  - [GCC v8.2](https://www.centos.org/)
  - [CMake v3.16](https://cmake.org/)

## How to get this docker container
- Ensure you have [Docker](http://www.docker.com/) installed and running
```bash
# make sure you're logged in to the public Docker remote
docker login docker.io

# pull the image
docker pull dylankenneally/centoscppbuildtools:latest
```

## Compile your app inside the Docker container
```bash
# compiling C++ apps
docker run --rm -v "$PWD":/usr/src/app -w /usr/src/app dylankenneally/centoscppbuildtools:latest g++ -o executable hello-world.cpp 

# using CMake
docker run --rm -v "$PWD":/usr/src/app -w /usr/src/app dylankenneally/centoscppbuildtools:latest cmake .
```

## To build the image yourself
- To build the image yourself
```bash
git clone https://github.com/dylankenneally/docker-build-containers.git
cd docker-build-containers
docker build --rm -f Dockerfile . -t dylankenneally/centoscppbuildtools:latest # change the tag name if you intend to `docker push`
```

## More information
- https://hub.docker.com/r/dylankenneally/centoscppbuildtools
