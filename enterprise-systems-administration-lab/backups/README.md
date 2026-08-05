# Enterprise Backup and Disaster Recovery Lab

A production-style systems administration portfolio project demonstrating backup governance, automated Windows Server and file protection, Active Directory system-state protection, restore validation, ransomware-resilient controls, monitoring, incident response, and disaster-recovery testing.

## Environment

- Domain: `corp.contoso.local`
- Backup server: `BKP-SRV01` — Windows Server 2022
- Protected servers: `DC01`, `FS01`, `APP01`
- Primary repository: `E:\BackupRepository`
- Offline copy: `F:\OfflineVault`
- Offsite copy: Azure Recovery Services vault `rsv-corp-prod-eastus`
- Automation account: `CORP\svc_backup`
- Backup window: 22:00–05:00 ET

## Business Objectives

| Service | RPO | RTO | Protection |
|---|---:|---:|---|
| Active Directory | 4 hours | 2 hours | System state + daily VM backup |
| Department file shares | 4 hours | 4 hours | Incremental + weekly full |
| Line-of-business application | 8 hours | 6 hours | Application-consistent backup |
| Backup configuration | 24 hours | 4 hours | Daily export and offsite copy |

## Implemented Controls

- 3-2-1-1-0 backup design
- Encrypted repositories and least-privilege service account
- Immutable/offline recovery copy
- Daily job monitoring and failure alerting
- SHA-256 integrity validation
- Monthly sample-file restores
- Quarterly server and Active Directory recovery exercises
- Documented RPO/RTO, retention, escalation, and evidence
- Completed incident, request, and change records

## Repository Map

- `architecture/` — logical topology and backup data flows
- `policies/` — approved backup, retention, security, and DR standards
- `configurations/` — implemented schedules, repositories, protected assets, and alert thresholds
- `powershell/` — usable automation and reporting scripts
- `runbooks/` — step-by-step operations and recovery procedures
- `evidence/` — sanitized outputs proving successful jobs and restores
- `tests/` — acceptance and recovery validation results
- `tickets/` — realistic service, incident, problem, and change records
- `reports/` — executive backup posture and monthly operational report

## Final Validation

All 24 acceptance criteria passed. Restore tests met their documented RPO and RTO targets, backup checksums matched, and no unresolved critical backup failures remained at project close.
