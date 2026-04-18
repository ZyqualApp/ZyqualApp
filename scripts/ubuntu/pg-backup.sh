#!/usr/bin/env bash
set -euo pipefail

BACKUP_DIR=/var/backups/postgres
DATE=$(date +%F)
mkdir -p "$BACKUP_DIR"

for DB in zyai zysms; do
  if sudo -u postgres psql -lqt | cut -d \| -f 1 | grep -qw "$DB"; then
    sudo -u postgres pg_dump -Fc "$DB" | gzip > "$BACKUP_DIR/${DB}_${DATE}.dump.gz"
  fi
done

find "$BACKUP_DIR" -type f -name "*.dump.gz" -mtime +7 -delete
