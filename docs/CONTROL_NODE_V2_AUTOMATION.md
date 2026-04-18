# Control Node V2 Automation

This document defines the second phase of the Control Node system.

## Objective

Move from semi-manual operation to controlled automation while preserving safety.

## Phase 1 (baseline)
- backup scripts exist
- manual verification possible
- basic scheduling enabled

## Phase 2 (this stage)
Add:
- alerting
- automated verification
- improved monitoring visibility
- structured logging

## Automation layers

### 1. Backup automation

Already in place:
- server-side backups
- Control Node convergence script

Enhancements:
- verify file sizes
- verify backup freshness
- log success/failure explicitly

### 2. Monitoring automation

Use Uptime Kuma to monitor:
- Zyqual health endpoint
- ZyAI health endpoint
- ZySMS health endpoint
- SSH port availability
- HTTPS availability
- SSL expiry

## Alerting

Preferred channels:
- email
- Telegram

Optional:
- WhatsApp (via API only, not primary system)

Alerts should trigger on:
- service downtime
- backup failure
- missing backups

## Logging

All Control Node scripts must:
- write to dated log files
- include timestamps
- include success/failure states

## Backup verification

Add checks:
- latest file exists
- file size is above minimum threshold
- backup timestamp is within expected window

## Restore validation routine

Weekly:
- restore one PostgreSQL backup
- restore one SQL Server backup

Monthly:
- decrypt one cloud archive
- inspect contents

## Cloud backup policy

Google Drive:
- daily encrypted uploads

AWS S3:
- daily or weekly encrypted uploads

AWS Glacier:
- monthly long-term retention

## Future phase (not yet)

Only after stability:
- automated retention cleanup
- automated deletion policies

## Critical rule

Never automate deletion before:
- verifying backup integrity
- confirming restore success
- observing stable operation for multiple weeks
