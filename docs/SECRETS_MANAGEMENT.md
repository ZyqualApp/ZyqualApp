# Secrets Management

## Objective

Ensure all credentials, keys, and sensitive data are handled securely.

## What counts as secrets

- SSH private keys
- database credentials
- API keys
- cloud credentials
- encryption passphrases

## Core rules

1. Never store secrets in Git
2. Never commit `.env` files
3. Always use least privilege
4. Always encrypt backups

## Storage locations

### Local (Mac)
- `~/.ssh/`
- encrypted files under external drive

### External drive
- encrypted archives only

### Cloud
- encrypted backups only

## Recommended tools

- password manager (e.g. Bitwarden)
- encrypted files using `age`

## Access model

- use SSH keys, not passwords
- separate keys by environment
- rotate keys periodically

## Recovery strategy

- keep backup of keys in encrypted archive
- store recovery instructions offline

## Future evolution

- move toward role-based access
- centralise secrets with a secure vault solution
