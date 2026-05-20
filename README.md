# Spriter

This is an extremely janky dev setup for working with the [spriter] software. It is required by the animation infrastructure of Don't Starve (and Together), but only runs on ancient versions of Windows and Linux, so is very much incompatible with M1+ Macs. This setup is a docker environment with X11 forwarding that emulates the x86-64 Ubuntu 14 environment needed to get the program to run.

[spriter]: https://brashmonkey.com/download-spriter-pro/

## Usage

Run `./open.sh`. The current working directory will be mounted to `/root` in the container.
<!--If the container isn't created, create it with ```bash
docker container create -it --name spriter --platform linux/x86_64 --net=host -e DISPLAY=host.docker.internal:0 -v /tmp/.X11-unix:/tmp/.X11-unix:rw --privileged spriter
```

Call `./open.sh`.-->

