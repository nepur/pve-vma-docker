FROM debian:buster

RUN echo deb "http://download.proxmox.com/debian buster pve" >> /etc/apt/sources.list

ADD http://download.proxmox.com/debian/key.asc /tmp/key.asc
#&& apt-key add /tmp/key.asc \

RUN apt-get update \
 && apt-get upgrade -y \
 && apt-get install -y gnupg2 \
 && apt-get install -y pve-qemu-kvm \
 && apt-get clean \
 && mkdir -p /backup

WORKDIR /backup

VOLUME /backup

