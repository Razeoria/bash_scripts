#!/bin/bash

backup_dir=("/opt" "/home/ec2-user")

backup_location="/backup"
mkdir -p "$backup_location"
for dir in "${backup_dirs[@]}"; do
	backup_file="$backup_location/$(basename "$dir")_backup_$(date +%Y-%m-%d).tar.gz"
	tar -czf "$backup_file" "$dir"
done
find "$backup_location" -maxdepth 1 -type f -name "*.tar.gz" -mtime +21 -delete
