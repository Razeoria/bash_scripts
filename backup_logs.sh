#!/bin/bash
LOG_DIR="/var/log/httpd"
LOG_FILE="access_log"
BACKUP_DIR="$LOG_DIR/backups"
ARCHIVE="$BACKUP_DIR/${LOG_FILE}-$(date +%Y%m%d).tar.gz"

mkdir -p "$BACKUP_DIR"
tar -czf "$ARCHIVE" "$LOG_DIR/$LOG_FILE" && > "$LOG_DIR/$LOG_FILE"
find "$BACKUP_DIR" -name "${LOG_FILE}-*.tar.gz" -mtime +3 -delete
