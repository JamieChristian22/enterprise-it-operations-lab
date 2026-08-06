# Backup Security Baseline

## Identity

- Human access uses federation and MFA; persistent access keys are prohibited.
- `BackupAdministrator` manages plans and assignments but cannot administer KMS keys.
- `BackupRestoreOperator` can initiate approved restores but cannot reduce retention or delete locked recovery points.
- `BackupAuditor` has read-only access to policies, jobs, vaults, logs, and evidence.
- Emergency access is time-bound, monitored, and reviewed within one business day.

## Encryption and isolation

- Tier 0 uses customer-managed encryption keys with rotation enabled.
- Cross-region copies use keys managed in the destination region.
- Terraform state uses versioning, replication, encryption, and object lock.
- Production recovery testing occurs in isolated networks with no default route to production.

## Immutability and deletion protection

- AWS Backup Vault Lock protects required recovery points.
- Azure soft delete and multi-user authorization are enabled where supported.
- Key deletion has a waiting period and separate security approval.
- Recovery-point deletion and retention changes generate alerts and audit events.

## Logging

CloudTrail, AWS Config, Azure Activity Log, Recovery Services diagnostics, KMS/Key Vault logs, and identity logs are retained independently from protected workloads.
