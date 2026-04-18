# Phase 5 — Live Dashboard Plan

## Objective

Turn the Control Node and monitoring system into a live operational dashboard that gives the CEO and future operations team immediate visibility.

## Core dashboard outcomes

The dashboard must answer these questions in under 60 seconds:

1. Are the systems up?
2. Are backups healthy?
3. Are there active alerts?
4. Are any servers under pressure?
5. Is any deployment or job failing?

## Dashboard sections

### 1. Executive status bar
- overall platform status
- last backup success time
- active alert count
- highest current risk

### 2. Service health tiles
- Zyqual
- ZyAI
- ZySMS
- ZyPATH(E)

Each tile should show:
- up/down/degraded
- response latency
- SSL status
- last successful health check

### 3. Backup health panel
For each platform:
- latest local backup time
- latest external drive convergence time
- latest cloud upload time
- backup size trend
- restore test status

### 4. Infrastructure metrics panel
From Netdata or future metrics API:
- CPU
- RAM
- disk
- network
- process restarts

### 5. Alerts and failures feed
- active alerts
- last 20 failures
- unresolved warnings

### 6. Deployment and maintenance feed
- last deployment time
- deployed version
- deployment result
- rollback activity

## Data sources

- Uptime Kuma API
- Control Node logs
- backup manifests
- Netdata metrics
- deployment logs

## Dashboard principles

- simple and executive-friendly
- one-screen summary first
- drill-down second
- no noisy clutter
- immediately actionable

## Delivery direction

Phase 5 dashboard can begin as:
- a dedicated internal page
- or an intelligence module inside the Zyqual ecosystem

## Future enhancements

- trend lines
- SLA view
- region/environment filters
- incident timeline
- audit trail panel
