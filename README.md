## OpenVPN Docker Server

Just a little OpenVPN server hosted in Docker.

#### Build image
```
docker build \
  -t docker-vpn \
  .
```

#### Run
```
docker run \
  --cap-add=NET_ADMIN \
  --name openvpn \
  -d \
  -p 1194:1194/udp \
  -v <path/to/openvpn>:/etc/openvpn \
  docker-openvpn
```

#### View Logs
```
sudo docker logs openvpn
```

#### Shell
```
sudo docker exec -it openvpn /bin/sh
```
