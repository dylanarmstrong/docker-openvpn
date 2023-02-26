#!/bin/sh -e

mkdir -p /dev/net
mknod /dev/net/tun c 10 200
chmod 600 /dev/net/tun

iptables -t nat -I POSTROUTING -o eth0 -j MASQUERADE

openvpn \
  --cd /etc/openvpn \
  --config server.conf \
  --cipher AES-128-CBC \
  --compress \
  --data-ciphers AES-128-CBC \
  --fragment 0 \
  --mssfix 0 \
  --tun-mtu 48000
