# System Intelligence Layer

## Objective

Move from reactive monitoring to intelligent system awareness.

## Core idea

The system should not only report problems.
It should help predict, explain, and guide decisions.

## Intelligence capabilities

### 1. Anomaly detection
- sudden drop in backup size
- unusual CPU spikes
- repeated service restarts

### 2. Trend analysis
- backup growth over time
- usage patterns
- peak system load periods

### 3. Risk scoring
Each system gets a risk score based on:
- uptime
- backup health
- alert frequency
- resource pressure

### 4. Recommendations
The system suggests:
- scale server resources
- investigate failing backups
- rotate keys or certificates

## Data inputs

- Control Node logs
- Uptime Kuma results
- Netdata metrics
- deployment history

## Output formats

- dashboard insights
- weekly summary reports
- alerts with context

## Future AI integration

- Claude or Gemini can:
  - summarise logs
  - detect patterns
  - generate reports

## Rule

Intelligence must support decisions, not replace them.
