FROM alpine:latest

LABEL maintainer="Dylan Armstrong <dylan@dylan.is>"

ENTRYPOINT ["/init.sh"]

RUN \
  apk add --update \
    curl \
    iptables \
    openvpn \
  && \
  \
  mkdir -p /var/log/openvpn \
  && \
  \
  rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/*

VOLUME ["/etc/openvpn"]

EXPOSE 1194/udp

COPY root/ /

HEALTHCHECK CMD curl -f http://localhost:1194/ || exit 1
