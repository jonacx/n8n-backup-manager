# n8n Backup Manager 🚀

![GitHub](https://img.shields.io/github/license/jonacx/n8n-backup-manager)
![GitHub last commit](https://img.shields.io/github/last-commit/jonacx/n8n-backup-manager)
![Platform](https://img.shields.io/badge/Platform-Linux%2C%20Windows-blue)

Interactive Bash tool to **backup and restore n8n workflows and credentials** on Oracle Cloud.  
Supports Docker, automatic backup retention, and optional syncing to a local Windows folder for secure, versioned disaster recovery.

---

## Features

✅ Backup n8n workflows and credentials automatically 
✅ Restore workflows and credentials from backups 
✅ Supports Docker installations of n8n 
✅ Optional local backup syncing to Windows folders 
✅ Easy push to GitHub with one click via push_git.bat 
✅ Cloudflare Tunnel integration for secure access 

## Requirements
Linux server running n8n (Docker recommended)
Windows or Linux machine for local backups (optional)
Git installed for version control
Cloudflare account for tunneling (optional)

## Installation

1. Clone this repository:

git clone https://github.com/jonacx/n8n-backup-manager.git

cd n8n-backup-manager


2. Make the script executable:

chmod +x n8n_manager.sh

3. Run the backup manager:

./n8n_manager.sh


## Usage

The script provides an interactive menu:

1. Backup Workflows – Automatically creates a .tar.gz backup of your n8n workflows and credentials.
2. Restore Workflows – Restore from a previous backup file.
3. Sync to Local Drive – Copy backups to your Windows folder, e.g., D:\N8N Automation\Oracle Cloud\backup.
4. Automatic Git Push – Use push_git.bat to commit and push changes to GitHub easily.


## Usage Example

1. Backup Workflows
Run the backup script:

./n8n_manager.sh

Select 1. Backup Workflows from the menu:

🚀 n8n Backup Manager
1. Backup Workflows
2. Restore Workflows
3. Sync to Local Drive
0. Exit
Select an option [0-3]: 1
📦 Backing up n8n workflows...
✅ Backup created: ~/.n8n/backup/n8n_backup_2025-10-16_0930.tar.gz

2. Restore Workflows
Select 2. Restore Workflows:

Select backup file to restore: n8n_backup_2025-10-16_0930.tar.gz
♻️ Restoring workflows and credentials...
✅ Restore complete!
```bash

3. Sync to Local Drive (Windows)
Select 3. Sync to Local Drive:

Enter Windows backup path (e.g., D:\N8N Automation\Oracle Cloud\backup): D:\N8N Automation\Oracle Cloud\backup
📂 Copying backup to Windows folder...
✅ Backup synced successfully!
```bash

4. Push Updates to GitHub
Run the push_git.bat script on Windows:

push_git.bat

Enter a commit message when prompted:

Enter commit message: Updated n8n backup script
✅ Changes pushed to GitHub successfully!


## Backup Location
*Linux server: ~/.n8n/backup/ (default)
*Windows PC: D:\N8N Automation\Oracle Cloud\backup (optional sync)

Folder Structure

n8n-backup-manager/
├── README.md               # Project description & usage instructions
├── LICENSE                 # MIT License
├── n8n_manager.sh          # Main backup & restore Bash script
├── push_git.bat            # One-click Git push script for Windows
└── .gitignore              # Excludes backups, logs, temporary files

Optional backup folders (ignored by Git):

~/.n8n/backup/             # Linux server backups
D:\N8N Automation\Oracle Cloud\backup  # Local Windows backups

## Notes
1. The backup file names include timestamps for versioning.
2. Local Windows backups are optional but recommended for redundancy.
3. Always check .gitignore to ensure backups are not uploaded to GitHub.
4. Keep your Cloudflare credentials secure if using tunnels.

License
This project is licensed under the MIT License.

Author

Jonacx – Personal automation tools & scripts
