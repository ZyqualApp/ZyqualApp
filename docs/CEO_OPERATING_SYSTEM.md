# CEO Operating System

This defines how the system owner operates the infrastructure daily.

## Daily (5–10 minutes)

Check:
- uptime dashboard (Uptime Kuma)
- latest backup log on Control Node
- any failed health checks

## Weekly (30–45 minutes)

- verify backups exist for all systems
- review logs for anomalies
- check disk usage on servers and external drive

## Monthly (1–2 hours)

- perform restore test (PostgreSQL)
- perform restore test (SQL Server)
- decrypt one cloud archive
- review infrastructure performance

## Decision rule

If system is unstable:
→ fix infrastructure first

If system is stable:
→ build features and expand

## Focus principle

The CEO does not manually operate systems.
The CEO verifies that systems operate correctly.

## Long-term evolution

- introduce dashboards for metrics
- introduce team access control
- introduce role-based monitoring
