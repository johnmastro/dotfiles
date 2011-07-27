#!/bin/sh

# A simple full-disk backup, based on the "Full System Backup with Rsync" 
# article from the Arch Linux Wiki

sudo sh -c "
    rsync -av --delete-excluded --exclude-from=backup.lst / /mnt/seagate/backup/;
    touch /mnt/seagate/backup/BACKUP
"
