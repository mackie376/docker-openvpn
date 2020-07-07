FROM alpine:3.12.0
LABEL maintainer="Takashi Makimoto <mackie@beehive-dev.com>"

COPY run.sh /usr/local/bin/

RUN apk --update --no-cache --no-progress add \
      bash \
      easy-rsa \
      openvpn && \
    chmod +x /usr/local/bin/run.sh && \
    rm -rf /var/cache/apk/*

WORKDIR /opt/easy-rsa

ENTRYPOINT ["/usr/local/bin/run.sh"]
