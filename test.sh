mk_certs () {
    if [ -e val ]; then
	echo Already have Certs
    else
	rm -f val val.pub
	ssh-keygen -t rsa -f val -P ''
    fi
}

docker_command () {
    ssh -Y -p 2222 -i val val@192.168.99.100 $*
}

alias cmd=docker_command

docker_build () {
    docker build -t u .
}

docker_run () {
    docker rm -f hello
    docker run -it --rm -p 2222:2222 \
	   -v `pwd`/ml:/home/val/ml \
	   --name=hello u /root/start.sh
}

br () {
    #mk_certs
    docker_build && docker_run
}

message () {
    echo "type 'mk_certs' to regen certs"
    echo "type 'br' to build and run"
    echo "type 'docker_command' to log into it"
}

echo 111 $0 222
if [ $0 == -bash ]; then
    message
elif [ $0 == bash ]; then
    message
else
    br
fi
