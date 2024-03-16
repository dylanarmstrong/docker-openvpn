#!/usr/bin/env sh

mkdir -p /dev/net
mknod /dev/net/tun c 10 200
chmod 600 /dev/net/tun

iptables -t nat -I POSTROUTING -o eth0 -j MASQUERADE

openvpn \
  --cd /etc/openvpn \
  --config server.conf \
  --allow-compression yes \
  --auth SHA1 \
  --cipher AES-128-GCM \
  --compress lz4-v2 \
  --data-ciphers AES-128-GCM \
  --push "compress lz4-v2"
