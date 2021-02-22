FROM debian:buster

# RUN echo deb "http://download.proxmox.com/debian buster pve-no-subscription" >> /etc/apt/sources.list

# ADD http://download.proxmox.com/debian/proxmox-ve-release-6.x.gpg /tmp/key.asc
# && apt-key add /tmp/key.asc \

RUN apt-get update \
 && apt-get upgrade -y \
 && apt-get install -y gnupg2 \
 && wget -O- "http://download.proxmox.com/debian/proxmox-ve-release-6.x.gpg" | apt-key add - \ 
 && apt-get update \
 && apt-get clean \
 && mkdir -p /backup

#&& apt-get install -y pve-qemu-kvm \

WORKDIR /backup

VOLUME /backup

