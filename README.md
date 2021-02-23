# PVE VMA extract

Image with all the necessary dependencies to extract a "backup" file from ProxmoxVE.

The image exposes `/backup` as a good place to mount the folder with the backup.

## Installation

Build the Docker image

```
git clone https://github.com/nepur/pve-vma-docker.git
cd pve-vma-docker
docker build -t vmaconverter .
```

## Usage

1. From the host run the docker image:

`docker run -it -v <BACKUPS DIRECTORY>:/backup vmaconverter:latest /bin/bash`

2. Now in the container change to backup directory to see the mounted images:

`$ cd /backup`

3. Uncrompress the archive with:

`$ lzop -d ./file.vma.lzo -p`

4. Then extract the archive with: 

`$ vma extract ./file.vma -v ./vmaextract`

There should now be two files in `vmaextract`:
- config_file
- raw_backup_file

5. As the last step convert the raw image to a VirtualBox image:

`$ qemu-img convert -p vmaextract/disk-drive-scsi0.raw vmaextract/disk-drive-efidisk0.raw -O vdi disk.vdi`
  
6. This should produce a vdi compatible with VirtualBox.  Also there should be a qemu.conf from step 4.

Extended command options for vma utility

```
$ vma
usage: vma command [command options]

vma list <filename>
vma create <filename> [-c config] <archive> pathname ...
vma extract <filename> [-v] [-r <fifo>] <targetdir>
vma verify <filename> [-v]
```
