#!/bin/bash
#======================================== ========================================
#
#     FILE:           			dirbackup.sh
#     PROJECT:           		Scripte
#     PATH:				C:\Users\march\Google Drive\Scripte\GitHub Repository\Shellscript-hilfe\dirbackup.sh
#     AUTHOR:              		HelpiStone
#     EMAIL:                  		helpi9007@gmail.com
#     CREATED:          		12-08-2017
#
#     MODIFIED BY:      		Helpi
#     MODIFIED DATE:  		13-08-2017
#
#     DESCRIPTION:   		"A shell script to back up a server's directory. ANY directory "
#
#======================================== ========================================
# Variable
sourcedir=""
backupdir=backups
hostname=$(/usr/bin/hostnamectl | grep hostname | cut -d: -f2 | sed 's/^[[:space:]]*//')
today=$(date +%Y-%m-%d)

if [ "$1" != "" ]; then
    sourcedir="$1"
else
    echo -e "Usage: ./dirbackup.sh <directory name>\nPlease run the script once more WITH the directory name."
    exit
fi

# check if the current user is root
if [[ $(/usr/bin/id -u) != "0" ]]; then
    echo -e "\nThis looks like a 'non-root' user.\nPlease switch to 'root' and run the script again.\n"
    exit
fi

# check if the backup location exists - /backups
if [ ! -d "$backupdir"  ]; then
    mkdir /$backupdir
fi

# Backup /etc and move it to /backup
tar czf /$backupdir/$sourcedir-${hostname}-${today}.tar.gz $sourcedir && logger "Backed up $sourcedir"
