# Evidence Index

This index directs reviewers to the most valuable evidence categories in the systems-administration lab.

| Capability | Evidence Type | Expected Location | What It Proves |
|---|---|---|---|
| Active Directory health | DCDIAG, replication, DNS output | `active-directory/evidence/` | Domain services are validated after administration work |
| User lifecycle | CSV logs and completed tickets | `active-directory/evidence/`, `tickets/` | Onboarding and offboarding are controlled and traceable |
| Group Policy | GPResult and policy documentation | `active-directory/evidence/` | Policy application and troubleshooting are understood |
| Backup operations | Job logs, checksum reports, restore validation | `backups/evidence/` | Backups are monitored and tested, not merely scheduled |
| Disaster recovery | Exercise reports and recovery timelines | `disaster-recovery/exercises/`, `evidence/` | Recovery objectives are tested against RTO and RPO |
| Capacity management | Baselines, forecasts, reports | `capacity/baselines/`, `forecasts/`, `reports/` | Resource risks are identified proactively |
| Change management | Approved changes and validation results | `changes/requests/`, `evidence/` | Infrastructure changes are governed and reversible |
| Configuration management | Idempotency, drift, DSC compliance | `configuration-management/evidence/` | Server state is repeatable and monitored for drift |
| Automation | PowerShell, Ansible, DSC source files | Relevant project `powershell/`, `ansible/`, `dsc/` folders | Repetitive administration work is automated |
| Reporting | Executive and monthly reports | Project `reports/` folders | Technical findings are communicated to stakeholders |

## Evidence Quality Rules

- Evidence is sanitized and contains no credentials.
- Each output maps to a documented task, ticket, change, or exercise.
- Results include timestamps, system names, status, and validation outcome.
- Failed or rolled-back changes are retained to demonstrate troubleshooting and control maturity.
