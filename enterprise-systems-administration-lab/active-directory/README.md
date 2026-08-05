# Enterprise Active Directory Administration Lab

**Owner:** Jamie Christian  
**Environment:** `corp.jamiechristian.lab`  
**Primary domain controller:** `JC-DC01` (`10.20.0.10`)  
**Secondary domain controller:** `JC-DC02` (`10.20.0.11`)  
**Client:** `JC-WS01` (`10.20.10.25`)  
**Assessment date:** 2026-08-05

## Executive Summary
This portfolio project demonstrates day-to-day administration of a two-domain-controller Windows Active Directory environment. It covers identity lifecycle management, role-based access control, delegated administration, Group Policy, DNS-integrated services, replication health, privileged and service account governance, account-lockout response, change control, PowerShell automation, and recovery operations.

The documentation is written as an operational package rather than a collection of screenshots. All evidence is sanitized, reproducible lab output. No production credentials, secrets, or personal data are included.

## Business Scenario
Jamie Christian Consulting is a 75-user organization with Finance, Human Resources, Information Technology, Operations, and Sales departments. The environment requires standardized onboarding, least-privilege group access, resilient authentication, auditable administrative changes, and documented recovery procedures.

## Implemented Outcomes
- Built a two-DC forest with AD-integrated DNS and a structured OU model.
- Defined global security groups and mapped them to resource permissions using AGDLP.
- Created onboarding and offboarding runbooks with approval and validation gates.
- Established workstation, password, lockout, audit, firewall, and administrator GPO baselines.
- Automated bulk user creation, disabled-user review, group audits, and AD health reporting.
- Documented DNS, replication, FSMO, service-account, lockout, and restore operations.
- Added realistic incident, service-request, and change records with completed resolutions.
- Captured command-based evidence suitable for a GitHub portfolio without relying on screenshots.

## Repository Map
| Area | Purpose |
|---|---|
| `architecture/` | Logical design, network layout, and OU/delegation model |
| `configurations/` | Implemented AD, DNS, GPO, and identity standards |
| `powershell/` | Reusable administrative automation |
| `evidence/` | Sanitized validation output and audit exports |
| `runbooks/` | Repeatable operational procedures |
| `security/` | Least privilege, privileged access, and review controls |
| `tickets/` | Completed incidents, requests, and changes |
| `change-management/` | Backout, validation, and approval records |
| `tests/` | Acceptance criteria and completed test results |

## Skills Demonstrated
Active Directory Domain Services, ADUC, Group Policy, DNS, replication, FSMO roles, PowerShell, RBAC, AGDLP, account lifecycle management, auditing, incident response, change management, backup/recovery, technical documentation, and ticket resolution.

## Validation Summary
All 18 acceptance tests passed. `dcdiag`, `repadmin /replsummary`, DNS resolution, SYSVOL/NETLOGON checks, GPO application, account-lockout controls, delegated administration, and scripted audit exports completed successfully. See `tests/acceptance-test-results.md`.
