FROM alpine:3.19

LABEL maintainer="Dylan Armstrong <dylan@dylan.is>"

WORKDIR /app

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

COPY ./scripts/init.sh ./

ENTRYPOINT ["./init.sh"]
