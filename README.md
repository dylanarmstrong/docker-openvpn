## OpenVPN Docker Server

Just a little OpenVPN server in Docker.

### Using docker-compose

```
cp docker-compose.example.yml docker-compose.yml
# Edit volumes to point to /etc/openvpn
docker-compose up -d
```

### Manual

#### Build image
```
docker build \
  -t dylanarms/openvpn-server \
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
  dylanarms/openvpn-server
```

#### View Logs
```
sudo docker logs openvpn-server
```

#### Shell
```
sudo docker exec -it openvpn-server /bin/sh
```
