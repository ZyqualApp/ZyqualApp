#!/usr/bin/env bash
set -euo pipefail

DATE=$(date +%F)
LOG=~/ControlNode/logs/check-services-$DATE.log
mkdir -p ~/ControlNode/logs

check () {
  local name="$1"
  local url="$2"
  echo "[$(date)] Checking $name -> $url" >> "$LOG"
  if curl -fsS --max-time 10 "$url" >/dev/null; then
    echo "[$(date)] OK: $name" >> "$LOG"
  else
    echo "[$(date)] FAIL: $name" >> "$LOG"
  fi
}

check "ZyAI"   "https://ai.zyqual.com/health"
check "ZySMS"  "https://sms.zyqual.com/health"
check "Zyqual" "https://app.zyqual.com/health"
