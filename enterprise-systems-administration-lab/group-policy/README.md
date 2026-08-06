# Enterprise Group Policy Administration Lab

A job-ready Group Policy portfolio package demonstrating policy design, controlled deployment, validation, troubleshooting, backup, and rollback in a Windows Server Active Directory environment.

## Business scenario

Northstar Services operates a Windows domain named `corp.northstar.local` with approximately 120 users and 85 Windows 11 endpoints. The IT team needs consistent workstation security, predictable updates, auditable administrative controls, and separate policy behavior for standard users, Help Desk staff, and shared kiosk computers.

This lab implements a production-style Group Policy lifecycle without relying on screenshots. Every change is documented through policy inventories, PowerShell exports, validation reports, change records, test cases, and rollback instructions.

## Environment

| Component | Configuration |
|---|---|
| Forest/domain | `corp.northstar.local` |
| Domain controller | `NS-DC01` — Windows Server 2022 |
| Management server | `NS-MGMT01` — Windows Server 2022 with GPMC/RSAT |
| Pilot workstation | `NS-WKS-PILOT01` — Windows 11 Enterprise |
| Standard workstation | `NS-WKS-023` — Windows 11 Enterprise |
| Help Desk workstation | `NS-HD-WS01` — Windows 11 Enterprise |
| Kiosk workstation | `NS-KIOSK-01` — Windows 11 Enterprise |
| Pilot user | `CORP\gpo.pilot` |
| Help Desk group | `CORP\GG-HelpDesk-Technicians` |
| Domain admins | `CORP\GG-Tier0-Domain-Admins` |

## OU design

```text
corp.northstar.local
├── Domain Controllers
└── CORP
    ├── Users
    │   ├── Standard
    │   ├── HelpDesk
    │   └── Pilot
    ├── Workstations
    │   ├── Standard
    │   ├── HelpDesk
    │   ├── Kiosks
    │   └── Pilot
    └── Servers
        └── Member
```

## Implemented policies

| GPO | Scope | Purpose |
|---|---|---|
| `CORP-DOM-Account-Policy-v1.0` | Domain root | Password, lockout, and Kerberos account policy |
| `CORP-WS-Security-Baseline-v1.0` | Workstations | Defender, firewall, UAC, SMB, removable storage, and hardening |
| `CORP-WS-Audit-Logging-v1.0` | Workstations | Advanced audit policy and PowerShell logging |
| `CORP-WS-Windows-Update-v1.0` | Workstations | Update installation and restart behavior |
| `CORP-USR-Session-Security-v1.0` | Users | Screen lock and inactivity controls |
| `CORP-HD-Admin-Tools-v1.0` | HelpDesk | RSAT access, local group preference, and targeted controls |
| `CORP-KIOSK-Lockdown-v1.0` | Kiosks | Loopback processing and user-interface restrictions |
| `CORP-PILOT-Validation-v1.0` | Pilot OUs | Safe pre-production validation settings |

## Repository structure

```text
group-policy/
├── README.md
├── gpo-design-standard.md
├── docs/
├── implementation/
├── automation/
├── validation/
├── evidence/
├── change-management/
├── troubleshooting/
└── templates/
```

## Demonstrated competencies

- Group Policy design and naming standards
- OU scoping, inheritance, security filtering, and loopback processing
- Policy backup and rollback
- PowerShell automation using the GroupPolicy module
- `gpresult` and Resultant Set of Policy validation
- Controlled pilot deployment and change management
- Root-cause analysis for common GPO failures
- Evidence generation without fabricated screenshots

## Deployment sequence

1. Review `docs/architecture-and-scope.md` and `gpo-design-standard.md`.
2. Run `automation/01-preflight-assessment.ps1` from an elevated PowerShell session on `NS-MGMT01`.
3. Create or verify the OU and security-group structure.
4. Run `automation/02-create-gpo-framework.ps1 -WhatIf` and review the planned changes.
5. Run the framework script without `-WhatIf` after approval.
6. Configure policy settings by following the implementation guides.
7. Back up all GPOs using `automation/03-backup-all-gpos.ps1`.
8. Link policies to the Pilot OUs first.
9. Execute `validation/Invoke-GPOValidation.ps1` on the pilot endpoint.
10. Complete the test plan and change record before broader deployment.

## Safety notes

- Scripts default to assessment or support `-WhatIf` where changes are made.
- No script stores credentials or weakens domain security.
- Account policy is documented for the domain root because Windows applies domain password policy at the domain level.
- Registry-based settings should be tested against the exact Windows build and organizational requirements before production use.

## Portfolio outcome

This package represents a complete Group Policy administration work sample: architecture, governance, implementation, automation, testing, evidence, incident response, and rollback are all included. It is suitable for Help Desk, Systems Administrator, Infrastructure Support, and Junior Cloud/Windows Operations portfolios.
