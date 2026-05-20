mount=$(realpath $1 2> /dev/null)
if ! [[ -d $mount ]]; then
  echo "error: $1 is not a valid mount directory."
  exit 1
fi

xhost +localhost
docker run --rm -it --init \
  --name spriter \
  --platform linux/x86_64 \
  --net=host \
  -e DISPLAY=host.docker.internal:0 \
  -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
  -v "$(dirname $BASH_SOURCE)":/root \
  -v "$mount":/mnt \
  --privileged \
  spriter