# Infrastructure Principles

These principles govern all Zyqual systems.

## Core principles

1. Nothing critical exists in one place.
2. Every deployment must be reversible.
3. Backups must be tested, not assumed.
4. Secrets must never be exposed or stored in Git.
5. Human error must not be catastrophic.
6. Systems must be automated safely, not manually operated.

## Backup philosophy

- 3 copies minimum
- 2 different storage media
- 1 offsite encrypted copy

## Security philosophy

- least privilege access
- key-based authentication only
- encrypted storage for backups and secrets

## Deployment philosophy

- never deploy without rollback
- never deploy untagged code
- health checks are mandatory

## Operational philosophy

- if unstable → fix infrastructure first
- if stable → build features
