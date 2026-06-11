#!/bin/bash

SOURCE_DIR="$HOME/learnings/backup-project/mydata"

BACKUP_DIR="$HOME/learnings/backup-project/backups"

LOG_FILE="$HOME/learnings/backup-project/logs/backup.log"

DATE=$(date +"%Y-%m-%d_%H-%M-%S")

BACKUP_NAME="backup_$DATE.tar.gz"

mkdir -p $BACKUP_DIR

echo "======================" >> $LOG_FILE
echo "Backup started: $DATE" >> $LOG_FILE

tar -czf $BACKUP_DIR/$BACKUP_NAME $SOURCE_DIR

if [ $? -eq 0 ]; then
    echo "Backup successful: $BACKUP_NAME" >> $LOG_FILE
else
    echo "Backup failed!" >> $LOG_FILE
fi