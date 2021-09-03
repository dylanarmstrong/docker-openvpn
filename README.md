## OpenVPN Docker Server

Just a little OpenVPN server hosted in Docker.

#### Build image
```
docker build \
  -t docker-openvpn-server \
  .
```

#### Run
```
docker run \
  --cap-add=NET_ADMIN \
  --name openvpn-server \
  -d \
  -p 1194:1194/udp \
  -v <path/to/openvpn>:/etc/openvpn \
  docker-openvpn-server
```

#### View Logs
```
sudo docker logs openvpn-server
```

#### Shell
```
sudo docker exec -it openvpn-server /bin/sh
```
