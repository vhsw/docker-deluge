# Docker Deluge

This is the Dockerfile to set up [Deluge](https://deluge-torrent.org) torrent client

## Usage

[Install docker](https://docs.docker.com/install/). Then pull image:

```bash
docker pull vhsw/deluge
```

And run it:

```bash
docker run -d \
    --name deluge
    -v /storage/downloads:/downloads \
    -v /storage/deluge-daemon/config:/config \
    -p 8112:8112 \
    -p 6881:6881/tcp \
    -p 6881:6881/udp \
    -p 6891:6891/tcp \
    -p 6891:6891/udp \
    -p 51434:51434/tcp \
    -p 51434:51434/udp \
    vhsw/deluge
```

## Build

Building from dockerfile:

```bash
git clone git@github.com:vhsw/docker-deluge.git
cd docker-deluge
docker build . -t deluge
```
