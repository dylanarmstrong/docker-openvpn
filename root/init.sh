#!/bin/sh -e

mkdir -p /dev/net
mknod /dev/net/tun c 10 200
chmod 600 /dev/net/tun

iptables -t nat -I POSTROUTING -o eth0 -j MASQUERADE

openvpn \
  --cd /etc/openvpn \
  --config server.conf \
  --data-ciphers AES-256-CBC
