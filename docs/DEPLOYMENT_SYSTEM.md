# Production Deployment System

## Objective

Provide safe, repeatable, and rollback-ready deployments for Zyqual platforms.

## Zyqual (Windows Server)

### Strategy

- timestamped release folders
- current symlink / pointer
- pre-deploy validation
- instant rollback

### Flow

1. build release
2. upload to server
3. validate assets
4. switch active release
5. verify health
6. rollback if failure

## ZyAI / ZySMS (Ubuntu)

### Strategy

- git-based deployment
- controlled restart (PM2 or Docker)
- Nginx reverse proxy

### Flow

1. pull latest code
2. install dependencies
3. build application
4. restart services
5. check health endpoint
6. rollback if needed

## Rollback rule

Every deployment must have a clear rollback path.

## Health checks

- must exist before deployment
- must be used after deployment

## Logging

- record every deployment
- record success/failure

## Guardrails

- no direct edits in production
- no deployment without backup
- no deployment without validation
