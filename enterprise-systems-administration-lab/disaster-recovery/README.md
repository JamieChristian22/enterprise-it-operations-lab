# Enterprise Disaster Recovery Lab

This portfolio demonstrates a complete disaster-recovery program for a mid-sized Windows infrastructure environment. It covers governance, business impact analysis, recovery sequencing, technical runbooks, exercise execution, validation evidence, automation, reporting, and continuous improvement.

## Environment
- Primary site: Charlotte data center
- Recovery site: Raleigh recovery zone
- Core services: Active Directory, DNS, DHCP, file services, IIS, SQL Server, monitoring, backup infrastructure
- Recovery model: warm standby with immutable backups and documented manual failover

## Recovery Objectives
| Service | RTO | RPO | Priority |
|---|---:|---:|---|
| Active Directory/DNS | 30 min | 15 min | Tier 0 |
| DHCP | 45 min | 30 min | Tier 1 |
| File Services | 60 min | 30 min | Tier 1 |
| SQL Application | 90 min | 15 min | Tier 1 |
| IIS Intranet | 120 min | 60 min | Tier 2 |
| Monitoring | 180 min | 60 min | Tier 2 |

## Portfolio Highlights
- Enterprise disaster recovery plan and policy
- Business impact analysis and dependency mapping
- Recovery architecture and service sequence
- Detailed runbooks for six infrastructure services
- Ransomware, host-loss, site-outage, and identity-failure scenarios
- PowerShell health, recovery, and validation scripts
- Completed quarterly exercise and annual tabletop exercise
- Evidence, tickets, corrective actions, executive reporting, and QA validation

## Repository Map
- `plans/` disaster-recovery strategy and procedures
- `bia/` service priorities, dependencies, and impact analysis
- `runbooks/` step-by-step recovery instructions
- `powershell/` automated recovery validation
- `exercises/` completed recovery exercises
- `evidence/` sanitized logs and results
- `reports/` management and technical reports
- `governance/` roles, risks, and corrective actions
- `tickets/` realistic incident and change records
- `tests/` acceptance-test results
