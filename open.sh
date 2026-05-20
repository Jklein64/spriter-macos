xhost +localhost
docker run --rm -it --init \
  --name spriter \
  --platform linux/x86_64 \
  --net=host \
  -e DISPLAY=host.docker.internal:0 \
  -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
  -v "$(pwd)":/root \
  --privileged \
  spriter