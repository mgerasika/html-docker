#for local testing/or local docker container
image=docker-html-example
container=docker-html-example
port=3131
#should coming from git commit hash
version=1


docker stop $container
docker image rm $image
docker rm $container
docker build -t $image -f Dockerfile . --build-arg REACT_APP_VERSION=$version
docker run --env PORT=80 -d -p $port:80 --name $container $image
