#Script to easy create and restore backups from folders on Linux servers using the tar command

#usage:
#1)move script to the folder that you want to process
#2)make the script executable (enter: chmod +x backup_restore.sh)
#3)run the script

read -p "backup (b) or restore (r)?" answer

case "$answer" in
        B|b) date=$(date +"%Y-%m-%d_%H-%M")
				echo create: Backup_$date.tgz
				tar --exclude='BACKUP_*' --warning=no-file-changed -cvpzf BACKUP_$date.tgz .
				exit 1
            ;;
        R|r) read -p "Enter the datecode to be restored YYYY-MM-DD_HH-MM?" datecode
				echo restore: BACKUP_$datecode.tgz
				tar -xvpzf BACKUP_$datecode.tgz
                exit 1
            ;;
        *) echo "Unknown Parameter" 
			exit 0
            ;;
esac
