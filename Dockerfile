FROM alpine:edge
LABEL maintainer="Alexey Dubrov <vhsw@ya.ru>"
LABEL org.label-schema.name="vhsw/deluge"
LABEL org.label-schema.vcs-url="https://github.com/vhsw/docker-deluge"
LABEL org.label-schema.docker.cmd="docker run \
-v ~/Downloads:/downloads \
-v ~/config:/config \
-p 8112:8112 \
-p 6881:6881/tcp \
-p 6881:6881/udp \
-p 6891:6891/tcp \
-p 6891:6891/udp \
-p 51434:51434/tcp \
-p 51434:51434/udp \
vhsw/deluge"

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
    && apk --no-cache add deluge \
    && rm -rf /etc/root/.config/deluge \
    && mkdir /config

COPY config /config
COPY wrapper.sh /

VOLUME ["/downloads", "/incomplete", "/watch", "/config"]
CMD ["/wrapper.sh"]
