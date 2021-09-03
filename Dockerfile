FROM alpine:latest

LABEL maintainer="Dylan Armstrong <dylan@dylan.is>"

RUN \
  apk add --update \
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

CMD /init.sh
