#!/bin/bash

BACKUP_DIR="$HOME/learnings/backup-project/backups"

RESTORE_DIR="$HOME/learnings/backup-project/restored"

echo "Available backups:"

ls $BACKUP_DIR/*.tar.gz

read -p "Enter backup filename: " BACKUP_FILE

mkdir -p $RESTORE_DIR

tar -xzf $BACKUP_DIR/$BACKUP_FILE -C $RESTORE_DIR

echo "Restored successfully!"