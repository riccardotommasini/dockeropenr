#!/bin/bash

cp ./docker-tcp.socket /etc/systemd/system/docker-tcp.socket

systemctl enable docker-tcp.socket
systemctl enable docker.socket
systemctl stop docker
systemctl start docker-tcp.socket
systemctl start docker

docker -H tcp://127.0.0.1:2375 ps