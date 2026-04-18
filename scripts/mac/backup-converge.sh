#!/usr/bin/env bash
set -euo pipefail

source ~/ControlNode/config/control-node.env

DATE=$(date +%F)
STAMP=$(date +%F_%H%M%S)
mkdir -p "$LOG_DIR" "$TMP_DIR"
exec >> "$LOG_DIR/backup-converge-$DATE.log" 2>&1

echo "=== Backup converge started: $(date) ==="

mkdir -p "$DRIVE/05_Databases/zyai/daily" "$DRIVE/05_Databases/zysms/daily" "$DRIVE/05_Databases/zyqual/daily"
mkdir -p "$DRIVE/04_Server_Backups/zyai-prod" "$DRIVE/04_Server_Backups/zysms-prod" "$DRIVE/04_Server_Backups/zyqual-prod"

# Pull Ubuntu DB backups
rsync -az "$ZYAI_HOST:/var/backups/postgres/" "$DRIVE/05_Databases/zyai/daily/"
rsync -az "$ZYSMS_HOST:/var/backups/postgres/" "$DRIVE/05_Databases/zysms/daily/"

# Pull Ubuntu config snapshots
rsync -az "$ZYAI_HOST:/var/backups/configs/" "$DRIVE/04_Server_Backups/zyai-prod/"
rsync -az "$ZYSMS_HOST:/var/backups/configs/" "$DRIVE/04_Server_Backups/zysms-prod/"

# Pull Windows backups (requires OpenSSH on Windows)
rsync -az "$ZYQUAL_HOST:/c/Backups/DB/" "$DRIVE/05_Databases/zyqual/daily/" || true
rsync -az "$ZYQUAL_HOST:/c/Backups/Config/" "$DRIVE/04_Server_Backups/zyqual-prod/" || true

# Weekly promotion on Sunday
if [ "$(date +%u)" = "7" ]; then
  rsync -a "$DRIVE/05_Databases/zyqual/daily/" "$DRIVE/05_Databases/zyqual/weekly/"
  rsync -a "$DRIVE/05_Databases/zyai/daily/" "$DRIVE/05_Databases/zyai/weekly/"
  rsync -a "$DRIVE/05_Databases/zysms/daily/" "$DRIVE/05_Databases/zysms/weekly/"
fi

# Monthly promotion on day 1
if [ "$(date +%d)" = "01" ]; then
  rsync -a "$DRIVE/05_Databases/zyqual/daily/" "$DRIVE/05_Databases/zyqual/monthly/"
  rsync -a "$DRIVE/05_Databases/zyai/daily/" "$DRIVE/05_Databases/zyai/monthly/"
  rsync -a "$DRIVE/05_Databases/zysms/daily/" "$DRIVE/05_Databases/zysms/monthly/"
fi

BUNDLE="$TMP_DIR/backup_bundle_$STAMP.tar"
ENCRYPTED="$TMP_DIR/backup_bundle_$STAMP.tar.age"

tar -cf "$BUNDLE" -C "$DRIVE" 05_Databases 04_Server_Backups
age -r "$(cat "$AGE_RECIPIENT_FILE")" -o "$ENCRYPTED" "$BUNDLE"
rm -f "$BUNDLE"

rclone copy "$ENCRYPTED" "$RCLONE_REMOTE:Zyqual_Backups/Encrypted/" --progress
aws s3 cp "$ENCRYPTED" "$S3_HOT_BUCKET/encrypted/$(basename "$ENCRYPTED")"

rm -f "$ENCRYPTED"

echo "=== Backup converge completed: $(date) ==="
