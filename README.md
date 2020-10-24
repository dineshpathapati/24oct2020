# Mounting Data Disk On Ubuntu
Hello, Thanks for taking a look on my repository:blush:

* Here in the repo you can find a bash file that will mount the data drive on ubuntu machine.
* We need to pass disk size as argument for this script.
* Before executing the script, check the output of lsblk command and do the changes to the script if required. 
* By default this script is prepared for the disk size which is in few GBs. If you are mounting disk which is in Terabytes then modify script by checking lsblk output.
* */etc/fstab* file entry will be done by the scripi itself.
* This script will mount the data disk to the directory */datadrive*
* Required directories will be created by the script
* Files system used for the data disk is ext4.

For more details follow,
Reference link: https://docs.microsoft.com/en-us/azure/virtual-machines/linux/attach-disk-portal

**Note**:
Make sure you understand script completely before executing

**Cautions**:
*This script wont work on a VM which has encrypted disks.
*Its recommended to execute the script only on new VMs.This script won't work for the multiple disk with same size.


