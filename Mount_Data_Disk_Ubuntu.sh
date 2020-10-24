#!/bin/bash

set -e
# keep track of the last executed command
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
# echo an error message before exiting
trap 'echo "\"${last_command}\" command filed with exit code $?."' EXIT

#Pass the disk size as argument for this script

size=$1

device="/dev/" 
device+="$(lsblk -l | grep "$size"G | cut -d ' ' -f 1)"

#Partition New Disk
sudo parted $device --script mklabel gpt mkpart  ext4 0% 100%

device+=1

#Formatting the New disk and assigning ext4 file system to it

sudo mkfs.ext4 "$device"

sudo partprobe "$device"

#Gather UUID for new block device

id="$(blkid "$device" | cut -d '"' -f 2)"

#Creating a folder to Map the new disk
cd /

sudo mkdir /datadrive

#Mounting the new disk to the /datadrive folder
sudo mount "$device"  /datadrive

#Preparing new disk details that should go into fstab file
appenddata="UUID=$id   /datadrive   ext4   defaults,nofail   1   2"

#Appending the fstab file with the new disk details
echo "$appenddata" >>/etc/fstab