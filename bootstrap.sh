#!/usr/bin/env bash

# This script is Fedora 22 onwards specific.

sudo dnf -y install docker
sudo systemctl start docker.service
sudo systemctl enable docker.service

# on-demand docker with systemd

sudo docker create --name nginx8080 -p 8080:80 nginx
sudo cp /vagrant/nginx-proxy.socket /etc/systemd/system/
sudo cp /vagrant/nginx-proxy.service /etc/systemd/system/
sudo cp /vagrant/nginx-docker.service /etc/systemd/system/
sudo systemctl enable nginx-proxy.socket
sudo systemctl daemon-reload
sudo systemctl start nginx-proxy.socket
sudo systemctl status nginx-proxy.socket
