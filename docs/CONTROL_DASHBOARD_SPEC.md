# Control Dashboard Specification

## Objective

Provide a single dashboard view for the CEO to understand system health in under 60 seconds.

## Core metrics

### System health
- Zyqual status
- ZyAI status
- ZySMS status

### Backup health
- last backup time
- backup success/failure
- size of latest backup

### Infrastructure
- server CPU usage (via Netdata)
- disk usage

## Dashboard layout

Header:
- overall status (green/yellow/red)

Section 1:
- service uptime tiles

Section 2:
- backup status tiles

Section 3:
- alerts and failures

## Data sources

- Uptime Kuma API
- Control Node logs
- Netdata metrics

## Future integration

- integrate into Zyqual Intelligence Dashboard
- role-based views (CEO, DevOps, Admin)

## Rule

The dashboard must be simple, fast, and immediately actionable.
