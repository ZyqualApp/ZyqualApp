# Zyqual Control Node & Infrastructure Master Index

This document is the single entry point for Zyqual operational architecture, Control Node automation, backup strategy, monitoring, restore validation, and CEO operating routines.

## Scope

This system covers:

- Zyqual — Windows Server / IIS / ASP.NET MVC / SQL Server
- ZyAI — Ubuntu / Node / Next.js / PostgreSQL
- ZySMS
- ZyPATH(E)
- Future Zyqual ecosystem services

## Purpose

The Control Node system exists to ensure:

- strong backup discipline
- encrypted off-server copies
- fast and safe rollback-aware operations
- live monitoring and alerting
- a simple but powerful solo-operator workflow
- clean growth toward team-based operations later

## Read in this order

1. `docs/CONTROL_NODE_BUILD_GUIDE.md`
2. `docs/CONTROL_NODE_V2_AUTOMATION.md`
3. `docs/INFRASTRUCTURE_PRINCIPLES.md`
4. `docs/CEO_OPERATING_SYSTEM.md`

## Core architecture summary

### 1. Control Node
The Mac is the initial Control Node.

It:
- pulls backups from Windows and Ubuntu servers
- stores backups on the external drive
- encrypts cloud backup bundles
- uploads encrypted copies to Google Drive and AWS S3
- runs scheduled health checks
- writes logs for every operation

### 2. Storage layers
- Mac internal SSD = active work only
- External drive = warm storage and recovery layer
- Google Drive = quick recovery cloud copy
- AWS S3 / Glacier = long-retention cloud protection

### 3. Monitoring stack
- Uptime Kuma = service and endpoint monitoring
- Netdata = Ubuntu system metrics
- local Control Node health scripts = operational verification

## Control rules

1. Nothing critical exists in one place only.
2. No secret belongs in Git.
3. Backups must be restore-tested.
4. Deployments must be reversible.
5. Automation must begin with non-destructive actions.
6. Monitoring must not depend on memory or manual checking.

## AI assistant instruction

When using Claude, Cursor, or another assistant:

- read this file first
- treat this repository as the operational source of truth
- preserve backup, restore, and rollback integrity
- avoid destructive changes without a safe phased plan
- prefer practical solo-operator solutions over overengineered complexity
