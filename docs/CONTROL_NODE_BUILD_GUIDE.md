# Control Node Build Guide

This guide turns the Control Node concept into an executable operational design.

## Objective

Use the Mac as the initial Control Node so it can:

- pull backups from Zyqual, ZyAI, and ZySMS servers
- store them on the external drive
- encrypt cloud upload bundles
- push encrypted copies to Google Drive and AWS S3
- run health checks and log results
- support later alerting and restore validation

## Control Node role

The Mac is the operator cockpit and the initial automation hub.

### Responsibilities
- scheduled backup convergence
- encrypted archival
- local operational logs
- health check execution
- backup verification

## Required local structure

```text
~/ControlNode/
  bin/
  config/
  logs/
  tmp/
  manifests/

/Volumes/Zyqual_Drive/Zyqual_Enterprise/
  04_Server_Backups/
  05_Databases/
  08_Logs/
  09_Secrets_Vault/
```

## Required tools on the Mac

Install:
- `rclone`
- `age`
- `jq`
- `coreutils`
- `awscli`

## Configuration file

Create `~/ControlNode/config/control-node.env`.

It should define:
- external drive root
- log directory
- temp directory
- rclone remote name
- AWS bucket names
- encryption key / passphrase file locations
- SSH host aliases for ZyAI, ZySMS, and Zyqual

## SSH requirements

The Control Node must use named SSH aliases only.

Examples:
- `zyai-prod`
- `zysms-prod`
- `zyqual-prod`

Rules:
- no password-based login
- use key-based authentication only
- keep identities scoped by platform and environment
- test all aliases before enabling automation

## Server-side backup jobs

### Ubuntu servers
Each Ubuntu server should provide:

1. PostgreSQL backup script
2. config snapshot script
3. cron jobs to run them nightly

Backup outputs should live in:
- `/var/backups/postgres/`
- `/var/backups/configs/`

### Windows server
The Windows Server should provide:

1. SQL Server backup job
2. IIS / application config snapshot job
3. Scheduled Tasks for both jobs

Backup outputs should live in:
- `C:\Backups\DB\`
- `C:\Backups\Config\`

## Core Mac jobs

### 1. backup-converge.sh
This script must:
- pull Ubuntu DB backups
- pull Ubuntu config snapshots
- pull Windows DB/config backups
- place files in the external drive structure
- promote weekly and monthly copies by schedule
- build an encrypted backup bundle
- upload encrypted bundle to Google Drive
- upload encrypted bundle to AWS S3
- write detailed logs

### 2. check-services.sh
This script must:
- hit public health endpoints
- record pass/fail in logs
- support later alerting

## Scheduling

Use `launchd` on macOS.

Required jobs:
- nightly backup convergence
- frequent health checks

## Monitoring layer

Use:
- Uptime Kuma for endpoint monitoring
- Netdata for Ubuntu system metrics

Monitoring is required because manual checking is not enough.

## Safe rollout order

1. create local directories
2. install tools
3. verify SSH aliases
4. implement Ubuntu backup jobs
5. implement Windows backup jobs
6. test backup convergence manually
7. enable launchd scheduling
8. install Uptime Kuma
9. install Netdata
10. perform first restore test

## First restore tests

Before trusting the system:
- restore one PostgreSQL dump into a test database
- restore one SQL Server backup into a test instance
- decrypt one encrypted cloud bundle successfully
- verify expected contents exist

## Guardrails

- do not automate deletion first
- do not store secrets in Git
- do not treat backup creation as proof of recoverability
- do not enable destructive pruning until at least 2 clean weeks of successful runs
