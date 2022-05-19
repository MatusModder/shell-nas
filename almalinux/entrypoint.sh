#!/usr/bin/env bash

harden_firewall() {
    # allow SSH
    iptables -A INPUT -p tcp --dport 22 -j ACCEPT
    # allow HTTP
    iptables -A INPUT -p tcp --dport 80 -j ACCEPT
    # allow HTTPS
    iptables -A INPUT -p tcp --dport 443 -j ACCEPT
}
enable_epel() {
    # enable EPEL
    yum install -y epel-release
}
install_docker() {
    # install Docker
    yum install -y yum-utils device-mapper-persistent-data lvm2
    yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
    yum install -y docker-ce
    systemctl start docker
    systemctl enable docker
}
pull_docker_imgs() {
    docker pull pawelmalak/flame
    docker pull nextcloud:latest
}