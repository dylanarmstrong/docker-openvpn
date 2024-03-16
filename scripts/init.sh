#!/usr/bin/env sh

mkdir -p /dev/net
mknod /dev/net/tun c 10 200
chmod 600 /dev/net/tun

iptables -t nat -I POSTROUTING -o eth0 -j MASQUERADE

openvpn \
  --cd /etc/openvpn \
  --config server.conf \
  --auth SHA1 \
  --cipher AES-128-GCM \
  --data-ciphers AES-128-GCM
