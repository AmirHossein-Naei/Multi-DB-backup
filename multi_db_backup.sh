#!/bin/bash

BACKUP_DIR="$(pwd)/backup_files"
CONFIG_FILE="$(dirname "$0")/databases.conf"
mkdir -p "$BACKUP_DIR"

while IFS=':' read -r type name user pass path || [[ -n "$type" ]]; do
  [[ "$type" =~ ^#.*$ || -z "$type" ]] && continue  # skip comments and empty lines

  db_folder="$BACKUP_DIR/$name"
  mkdir -p "$db_folder"
  timestamp=$(date +"%Y%m%d-%H%M%S")

  if [ "$type" = "mysql" ]; then
    mysqldump -u "$user" -p"$pass" "$name" > "$db_folder/backup-$timestamp.sql"
  elif [ "$type" = "sqlite" ]; then
    cp "$path" "$db_folder/backup-$timestamp.db"
  fi

  ls -1t "$db_folder"/backup-* | tail -n +11 | xargs -r rm --
done < "$CONFIG_FILE"
