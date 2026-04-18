# RBAC Model (Role-Based Access Control)

## Objective

Prepare the system for multi-user operation with clear permissions and responsibilities.

## Roles

### 1. SUPER ADMIN
- full system control
- can view all regions, schools, systems
- can manage users and permissions

### 2. DEVOPS ADMIN
- manages infrastructure
- manages deployments
- manages backups and monitoring

### 3. REGION DIRECTOR
- sees systems in their region
- views dashboards and alerts
- cannot modify infrastructure

### 4. SCHOOL ADMIN
- sees school-level systems
- limited dashboard visibility

### 5. READ-ONLY / AUDITOR
- view-only access
- audit logs and reports

## Permission groups

- view_dashboard
- view_logs
- view_alerts
- manage_backups
- manage_deployments
- manage_users

## Access rules

- least privilege by default
- role determines scope
- scope determines visibility (national, region, school)

## Implementation direction

- integrate with Zyqual identity system
- store roles in database
- apply permission checks in API layer

## Future

- fine-grained permissions
- temporary access tokens
- audit trail for all actions
