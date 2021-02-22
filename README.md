# PVE VMA extract

Image with all the necessary dependencies to extract a "backup" file from ProxmoxVE.

The image exposes `/backup` as a good place to mount the folder with the backup.

## Installation

Build the Docker image

`git clone https://github.com/nepur/pve-vma-docker.git
cd pve-vma-docker
docker build -t "$USER/vma" .`

## Usage

> docker run -t -i -v <BACKUPS DIRECTORY>:/backups nepur/pve-vma-docker:latest /bin/bash

`root@myserver:/# cd /backups
root@myserver:/backups# vma
usage: vma command [command options]

vma list <filename>
vma create <filename> [-c config] <archive> pathname ...
vma extract <filename> [-v] [-r <fifo>] <targetdir>
vma verify <filename> [-v]`

Uncrompress the archive with:

> $ lzop -d ./file.vma.lzo -p

Then extract the archive with 

> $ vma extract ./file.vma -v ./vmaextract

There should now be two file in `vmaextract`:

- config_file
- raw_backup_file
