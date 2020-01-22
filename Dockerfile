FROM debian

ENV \
    DEBIAN_FRONTEND=noninteractive

RUN \
    apt-get update && \
    apt-get install -y --no-install-recommends --no-install-suggests \
        ca-certificates curl git xz-utils zip unzip bzip2 re2c supervisor

RUN mkdir -p /etc/supervisor/conf.d

ADD rootfs /

CMD ["supervisord", "-c", "/etc/supervisord.conf"]
