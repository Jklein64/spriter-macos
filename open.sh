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
# xhost +localhost
# STATE=$(docker container ls --all --filter 'name=spriter' --format '{{ .State }}')
# if [[ "$STATE" != "running" ]]; then
#   docker start spriter
# fi
# docker exec -it -v $(pwd)/:/root spriter '/root/SpriterR10(64)/Spriter'
# docker container create -it --name spriter --platform linux/x86_64 --net=host -e DISPLAY=host.docker.internal:0 -v /tmp/.X11-unix:/tmp/.X11-unix:rw --privileged spriter
# docker run --rm -it --platform linux/x86_64 --net=host -e DISPLAY=host.docker.internal:0 -v /tmp/.X11-unix:/tmp/.X11-unix:rw --privileged spriter /bin/bash