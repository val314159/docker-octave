if [ -e val ]; then
    echo Already have Certs
else
    rm -f val val.pub
    ssh-keygen -t rsa -f val -P ''
fi

docker_build () {
    docker build -t u .
}

docker_run () {
    docker rm -f hello
    docker run -it --rm -p 2222:2222 \
	   -v `pwd`/ml:/home/val/ml \
	   --name=hello u /root/start.sh
}

docker_build && docker_run
