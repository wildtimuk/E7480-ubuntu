#!/bin/bash

# Configuration
SOURCE_DIR="/path/to/local/files"
DEST_DIR="/mnt/netshare"
REMOTE_SERVER="192.168.1.127"
SHARE_TYPE="cifs"                    # Use "nfs" for NFS shares
REMOTE_SHARE="//192.168.1.127/smb"  # SMB UNC path
CRED_FILE="/etc/samba/backup-cred"   # Secure credentials file
LOG_FILE="/var/log/network_backup.log"
EMAIL="wildtim@hotmail.com"
DATE=$(date '+%Y-%m-%d %H:%M:%S')

# Logging function
log_message() {
    echo "[$DATE] $1" >> "$LOG_FILE"
}

# Email function
send_email() {
    SUBJECT="$1"
    BODY="$2"
    echo "$BODY" | mail -s "$SUBJECT" "$EMAIL"
}

# Check remote server availability
if ping -c 2 "$REMOTE_SERVER" > /dev/null 2>&1; then
    echo "Server reachable, testing share.."
    log_message "Remote server reachable."
    #Now test the network share is accessible
    #This is commented out as it is difficult when the share requires credentials
    #if smbclient -L //192.168.1.108 -U  -g | grep -q smb; then
    #    echo "Remote share is reachable!"
    #    log_message "Remote share reachable."
    #else
    #    echo "Remote server is reachable but share is not found!"
    #    log_message "Remote server is reachable but share is not found."
    #    Exit 1    #Exit the script with error code 2
    #fi

else
    echo "Remote server not online"
    log_message "ERROR: Remote server offline."
    #send_email "Backup FAILED" "Remote server $REMOTE_SERVER is offline. Backup aborted."
    exit 1
fi

# Check if destination is mounted
echo "Testing share"
if findmnt -M /mnt/netshare &> /dev/null 2>&1; then
    log_message "Shared folder is mounted"
    echo "Shared folder Mounted"
else
    echo "Remote location not mounted"
    log_message "Shared folder is not mounted."
    exit 2
fi

#Lets try to relaod all mounts in fstab
#These should persist after a reboot but may fail of the other remote deice is offline

echo "trying to remount all folders in fstab"
log_message "trying to remount all folders entered into fstab"
mount -a
#Check of the mount -a command was successfuly
if [$? -eq 0] then
    echo "fstab reloaded"
    log_message "fstab successfully reloaded"
else 
    echo "fstab failed"
    log_message "fstab reload failed"

fi



# Perform backup using rsync
echo "Starting backup"
log_message "Starting backup..."

#Insert rsync lines here
#Lg messages 
#if [ $? -eq 0 ]; then
#    log_message "Backup completed successfully."
#    send_email "Backup SUCCESS" "Backup completed successfully at $DATE."
#else
#    log_message "ERROR: Backup failed during rsync."
#    send_email "Backup FAILED" "Backup failed during rsync at $DATE."
#fi


