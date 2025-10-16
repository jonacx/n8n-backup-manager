#!/bin/bash

USERNAME=$(whoami)
WIN_DIR="/mnt/d/N8N Automation/Oracle Cloud/backup"
KEEP=7
N8N_DATA="$HOME/.n8n"

show_menu() {
  echo -e "\n🚀 n8n Backup & Restore Manager"
  echo "1. Create backup now"
  echo "2. Restore a backup"
  echo "3. List available backups"
  echo "4. Delete old backups manually"
  echo "0. Exit"
  echo -n "Select an option [0-4]: "
}

list_backups() {
  echo -e "\n📦 Available backups:"
  ls -1t "$HOME"/n8n_backup_*.tar.gz 2>/dev/null || echo "No backups found."
}

create_backup() {
  TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
  BACKUP_DIR="$HOME/n8n_backup_$TIMESTAMP"
  mkdir -p "$BACKUP_DIR"

  # Copy n8n data
  cp -r "$N8N_DATA"/* "$BACKUP_DIR"

  # Compress backup
  tar -czf "$BACKUP_DIR.tar.gz" -C "$BACKUP_DIR" .
  rm -rf "$BACKUP_DIR"

  # Remove old backups (keep last $KEEP)
  cd $HOME
  ls -1t n8n_backup_*.tar.gz | tail -n +$((KEEP+1)) | xargs -r rm --

  echo "[Server] Backup completed: $BACKUP_DIR.tar.gz"

  # Sync to Windows
  if [ -d "$WIN_DIR" ]; then
      rsync -avz --ignore-existing "$HOME"/n8n_backup_*.tar.gz "$WIN_DIR"
      echo "[Server] Backup synced to Windows: $WIN_DIR"
  else
      echo "[Warning] Windows backup folder not found: $WIN_DIR"
  fi
}

restore_backup() {
  list_backups
  read -p "Enter full path of backup to restore: " BACKUP_FILE
  [ ! -f "$BACKUP_FILE" ] && { echo "❌ Backup file not found!"; return; }

  # Stop n8n container
  docker stop n8n

  # Extract backup
  tar -xzf "$BACKUP_FILE" -C "$N8N_DATA"

  # Fix permissions
  chown -R $USERNAME:$USERNAME "$N8N_DATA"
  chmod -R 700 "$N8N_DATA"

  # Start n8n container
  docker start n8n

  echo "[Server] Restore completed from $BACKUP_FILE"
}

delete_old_backups() {
  cd $HOME
  echo "[Server] Removing all backups except the last $KEEP..."
  ls -1t n8n_backup_*.tar.gz | tail -n +$((KEEP+1)) | xargs -r rm --
  echo "[Server] Old backups cleaned."
}

# =========================
# Main Loop
# =========================
while true; do
  show_menu
  read choice
  case $choice in
    1) create_backup ;;
    2) restore_backup ;;
    3) list_backups ;;
    4) delete_old_backups ;;
    0) echo "👋 Exiting..."; exit ;;
    *) echo "❌ Invalid choice." ;;
  esac
done
