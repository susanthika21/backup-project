# Shell Script Backup Automation Project

## Project Overview

This project automates the backup and restore process using Bash shell scripting.

# Project Goal
Create a shell script that:
Takes a backup of a folder
Compresses it into a .tar.gz file
Stores it in a backup directory
Creates logs
Restores backups when needed
Stores code in GitHub

# Features:

* Create compressed backups using tar
* Generate timestamped backup files
* Maintain backup logs
* Restore backups when needed
* Version control using Git and GitHub

---

## Project Structure
```text
backup-project/
│
├── backup.sh
├── restore.sh
├── README.md
├── .gitignore
│
├── mydata/
│   ├── file1.txt
│   └── file2.txt
│
├── backups/
│
├── logs/
│
└── restored/
```

---

## Technologies Used

* Linux / macOS Terminal
* Bash Shell Scripting
* Git
* GitHub

---
## Linux Commands Used
Check Current Location --- pwd
List Files --- ls
Create Folder-- mkdir logs
mkdir logs--- mkdir logs backups mydata
Create Empty File--- touch backup.sh
Open VS Code--- code .
Display File Content--- cat mydata/file1.txt
Make File Executable--- chmod +x backup.sh


## Backup Script

The backup script:

1. Reads files from the source directory.
2. Creates a compressed `.tar.gz` backup.
3. Stores backups in the backups folder.
4. Writes status information to a log file.

# Explanation Line by Line

#!/bin/bash
Tells Linux/Mac:Run this script using Bash.

SOURCE_DIR="$HOME/learnings/backup-project/mydata"
Folder to backup. Contains: file1.tx, file2.txt

BACKUP_DIR="$HOME/learnings/backup-project/backups"
Where backups are stored.

LOG_FILE="$HOME/learnings/backup-project/logs/backup.log"
Stores backup history.

DATE=$(date +"%Y-%m-%d_%H-%M-%S")
Generates timestamp.

BACKUP_NAME="backup_$DATE.tar.gz"
Result:backup_2026-06-11_15-27-43.tar.gz

mkdir -p $BACKUP_DIR
Creates backup directory if missing.
-p means:Don't throw error if folder already exists.

echo "======================" >> $LOG_FILE
echo "Backup started: $DATE" >> $LOG_FILE
Logging: Adds message to log file.  ">>" --Append to file

tar -czf $BACKUP_DIR/$BACKUP_NAME $SOURCE_DIR
Creates:backup.tar.gz    from:mydata/

| Option | Meaning             |
| ------ | ------------------- |
| c      | Create archive      |
| z      | Compress using gzip |
| f      | Filename            |


if [ $? -eq 0 ]; then
    echo "Backup successful: $BACKUP_NAME" >> $LOG_FILE
else
    echo "Backup failed!" >> $LOG_FILE
fi

Exit Status: $? -- Returns result of previous command.

Example:
tar -czf ...
Success: $? = 0
Failure: $? = 1
or other non-zero values.
if Condition
if [ $? -eq 0 ]
Means: Did the previous command succeed?
If yes: Backup successful
Otherwise: Backup failed


Run:

```bash
chmod +x backup.sh
./backup.sh
```
Creates:
backups/
└── backup_2026-06-11_15-27-43.tar.gz
---

Log File: View logs:--- cat logs/backup.log


## Restore Script

The restore script:

1. Displays available backups.
2. Prompts the user to select a backup file.
3. Extracts the selected backup into the restore directory.


#!/bin/bash

BACKUP_DIR="$HOME/learnings/backup-project/backups"

RESTORE_DIR="$HOME/learnings/backup-project/restored"

echo "Available backups:"

ls $BACKUP_DIR/*.tar.gz
List Backups

read -p "Enter backup filename: " BACKUP_FILE
Read User Input. Stores input in variable.

mkdir -p $RESTORE_DIR

tar -xzf $BACKUP_DIR/$BACKUP_FILE -C $RESTORE_DIR

| Option | Meaning |
| ------ | ------- |
| x      | Extract |
| z      | Gzip    |
| f      | File    |

Run:

```bash
chmod +x restore.sh
./restore.sh
```

---

## Git Commands Used

Initialize repository:

```bash
git init
```

Add files:

```bash
git add .
```

Commit changes:

```bash
git commit -m "Initial backup automation project"
```

Push to GitHub:

```bash
git push -u origin main
```
Rename Branch
```bash
git branch -M main
```
Changes:
master → main

Add Remote
```bash
git remote add origin https://github.com/susanthika21/backup-project.git
```
Connects local repo to GitHub.

Push
```bash
git push -u origin main 
```
Uploads code to GitHub.


---

## Sample Output

Backup file created:

```text
backup_2026-06-11_15-27-43.tar.gz
```

Log output:

```text
Backup started: 2026-06-11_15-27-43
Backup successful
```

---
### Most Important Interview Questions
What is Shell Scripting?
A shell script is a file containing Linux commands that are executed automatically by the shell.

What is chmod +x?
Adds execute permission to a file.

What is tar?
A command used to archive and compress files.

Difference between tar -czf and tar -xzf?
tar -czf → Create compressed archive
tar -xzf → Extract compressed archive

What is $? in shell scripting?
Stores exit status of the previous command.

What is .gitignore?
Used to tell Git which files/folders should not be tracked.

What does git add . do?
Moves all files from working directory to staging area.

What does git commit do?
Creates a snapshot of staged changes.

What does git push do?
Uploads local commits to GitHub.


## Author

Susanthika M
