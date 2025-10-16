# n8n Backup & Restore Manager – Oracle Cloud Edition

## 🚀 Overview
The **n8n Backup & Restore Manager** is a terminal-based, menu-driven tool designed for n8n users running instances on **Oracle Cloud (or any Ubuntu server)**. This script allows you to **easily back up and restore your n8n workflows, credentials, and settings**, while providing optional synchronization with a **local Windows PC folder**. It is fully automated yet interactive, combining safety, efficiency, and simplicity for daily n8n management.

---

## 🛠 Features

- **Interactive Menu Interface**  
  - Simple, numbered menu to navigate backup and restore tasks.  
  - Inspired by Cloudflare Tunnel manager scripts, making it intuitive for system administrators.

- **Automated Backup Creation**  
  - Creates compressed backups of your `.n8n` directory.  
  - Automatically removes old backups, keeping only the last **7** by default.  
  - Provides timestamped backups for easy versioning.

- **Restore Functionality**  
  - Restore workflows and credentials with a single command.  
  - Stops and starts the n8n Docker container automatically during restore.  
  - Ensures correct file ownership and permissions for secure operation.

- **Windows Sync Integration**  
  - Automatically copies new backups to a **Windows folder** (example: `D:\N8N Automation\Oracle Cloud\backup`).  
  - Works with **WSL or Git Bash with rsync** installed.  
  - Ensures your workflows are available locally for disaster recovery.

- **Manual Backup Management**  
  - List all existing backups on the server.  
  - Delete old backups manually if needed.

- **Safe Defaults and Permissions**  
  - Uses secure folder permissions (`chmod 700`) to protect sensitive credentials.  
  - Designed to work seamlessly with n8n running in Docker.

---

## 💾 Installation

1. SSH into your Oracle Cloud Ubuntu server (or local Ubuntu).  
2. Download or create the script:

```bash
nano ~/n8n_manager.sh
