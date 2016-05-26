
## Docker Octave

Build this with:

```sh
docker build -t u https://github.com/val314159/docker-octave.git
```

Run this with:

```sh
docker run --rm -it -p 2222:2222 -v `pwd`/ml:/home/val/ml --name=hello --privileged u ./start.sh
```
