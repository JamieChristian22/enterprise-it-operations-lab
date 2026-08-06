# RDS PostgreSQL Point-in-Time Restore

**Use when:** production data is corrupted, deleted, or unavailable and recovery to a known-good timestamp is approved.  
**Target RPO/RTO:** 15 minutes / 2 hours.

## Prerequisites

- Incident or approved recovery change record.
- AWS console or CLI access through the `BackupRestoreOperator` role.
- Approved recovery timestamp in UTC.
- Database subnet group, security groups, parameter group, KMS key, and application secret references.

## Procedure

1. Confirm the current incident scope and stop application writes when instructed.
2. Record the source database identifier and latest restorable time:
   ```bash
   aws rds describe-db-instances --db-instance-identifier orders-prod-db      --query 'DBInstances[0].[LatestRestorableTime,DBSubnetGroup.DBSubnetGroupName,VpcSecurityGroups[*].VpcSecurityGroupId]'
   ```
3. Restore to a new identifier; never overwrite the source:
   ```bash
   aws rds restore-db-instance-to-point-in-time      --source-db-instance-identifier orders-prod-db      --target-db-instance-identifier orders-prod-db-restore-20260801      --restore-time 2026-08-01T09:40:00Z      --db-instance-class db.t3.medium      --no-publicly-accessible
   ```
4. Wait for `available`, attach the approved security and parameter groups, and verify encryption.
5. Connect from the recovery validation host and run integrity checks:
   ```sql
   SELECT now();
   SELECT count(*) FROM orders;
   SELECT max(created_at) FROM orders;
   SELECT count(*) FROM pg_stat_activity;
   ```
6. Compare row counts and transaction totals with the pre-incident control report.
7. Update the application secret or DNS record through an approved change, then restart writes.
8. Monitor error rate, latency, connection count, and replication/backup status for 60 minutes.

## Rollback

Repoint the application to the original database if it remains trusted and the restored database fails validation. Do not delete either database until the incident commander approves cleanup.

## Evidence

Capture CLI output, restored identifier, recovery timestamp, integrity results, application health checks, actual RTO, approver, and cleanup change.
