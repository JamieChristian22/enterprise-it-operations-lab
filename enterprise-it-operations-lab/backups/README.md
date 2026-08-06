# 💾 Enterprise Backup and Recovery Lab

![Backup](https://img.shields.io/badge/Backup-Enterprise%20Operations-0052CC?style=for-the-badge)
![Recovery](https://img.shields.io/badge/Recovery-RTO%20%26%20RPO-success?style=for-the-badge)
![Security](https://img.shields.io/badge/Security-Immutable%20Copies-critical?style=for-the-badge)
![Automation](https://img.shields.io/badge/Automation-PowerShell%20%7C%20Bash%20%7C%20Python-orange?style=for-the-badge)

A production-style backup and recovery portfolio project covering policy, workload protection, restore testing, immutable copies, monitoring, automation, incidents, reporting, recovery objectives, and validation.

## Business Scenario

Northstar Services operates Windows Server, Linux, Active Directory, Microsoft 365, PKI, AWS, file services, and database workloads. The infrastructure team must protect business data, validate recoverability, detect failed or stale backups, and maintain clear recovery procedures.

## Core Design

- 3-2-1-1-0 backup strategy
- Local, offsite, and immutable copies
- Encryption in transit and at rest
- Role-based access
- Separate backup administration
- Daily job monitoring
- Monthly restore testing
- Quarterly disaster-recovery exercises
- Workload-specific RTO and RPO
- Automated freshness, integrity, and reporting checks

## Protected Workloads

- Windows Server
- Linux servers
- Active Directory system state
- File services
- Microsoft 365
- Enterprise PKI
- Databases
- AWS resources
- Configuration and automation repositories

## Repository Structure

```text
enterprise-backup-and-recovery-lab/
├── architecture/
├── automation/
├── configuration/
├── evidence/
├── incidents/
├── inventories/
├── policies/
├── procedures/
├── reports/
├── restore-tests/
├── runbooks/
└── tests/
```

## Demonstrated Skills

- Define backup tiers and retention.
- Design immutable and isolated recovery copies.
- Back up Windows, Linux, AD, PKI, M365, databases, and AWS.
- Validate backup freshness and checksums.
- Run file, server, AD, database, and PKI restore tests.
- Investigate failed backups.
- Monitor capacity and repository growth.
- Produce backup compliance reports.
- Automate reporting and validation.
- Document incidents, recovery evidence, and corrective actions.
