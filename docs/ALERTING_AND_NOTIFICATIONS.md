# Alerting and Notifications

## Objective

Add practical, reliable alerting to the Zyqual Control Node and monitoring stack.

## Preferred channels

Primary:
- email
- Telegram

Secondary:
- dashboard notifications

Optional later:
- WhatsApp via API only

## Why not WhatsApp first

WhatsApp is better as a notification endpoint than as a monitoring backbone.
It adds more complexity, approval constraints, and API overhead than email or Telegram.

## Alert sources

### 1. Uptime Kuma
Use Uptime Kuma for:
- endpoint downtime
- TLS/SSL expiry warnings
- latency degradation
- TCP / port failures

### 2. Control Node scripts
Mac scripts should emit alerts for:
- backup job failures
- missing latest backup files
- cloud upload failure
- encryption failure

### 3. Server metrics
Netdata should be used for:
- CPU overload
- RAM exhaustion
- disk pressure
- process instability

## Minimum alert matrix

### Critical
- public service down
- no successful backup in expected window
- cloud backup upload failed

### Warning
- disk nearing threshold
- SSL nearing expiry
- backup size unexpectedly small

## Telegram direction

Use a Telegram bot for simple first-stage alerts.

Flow:
1. create Telegram bot
2. get bot token
3. get chat id
4. call Telegram sendMessage API from shell script

## Email direction

Use SMTP or a transactional provider.

Script should send:
- alert subject
- system name
- timestamp
- failure reason
- latest log path

## Guardrails

- do not spam alerts on every retry
- add basic cooldown / dedup logic later
- only alert on meaningful operational failures
