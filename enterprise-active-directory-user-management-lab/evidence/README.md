# Enterprise Active Directory Evidence Package

This package documents the design, operation, validation, and security review of the **Enterprise Active Directory User Management Lab**.

## Why This Evidence Package Is Different

The repository includes two clearly separated evidence types:

1. **Documented lab evidence** — inventories, reports, runbooks, tickets, tests, and operational records that describe the completed lab.
2. **Repeatable evidence collectors** — PowerShell scripts that generate fresh AD, GPO, DNS, permissions, event-log, and domain-health artifacts directly from the running environment.

This avoids relying on screenshots while still giving reviewers a reproducible way to verify the technical work.

## Environment

- Domain: `corp.contoso.local`
- NetBIOS name: `CONTOSO`
- Domain Controller: `DC01`
- File Server: `FS01`
- Domain Client: `CL01`
- Server OS: Windows Server 2022
- Client OS: Windows 11 Enterprise
- Access model: AGDLP
- Automation: PowerShell
- Evidence date: August 5, 2026

## Coverage

- 75-user inventory
- 18 security groups
- 12 organizational units
- 6 Group Policy Objects
- 9 file-share permission mappings
- User onboarding, transfer, leave, termination, and rehire
- Password resets and account unlocks
- Delegated Help Desk administration
- Group Policy validation
- Domain, DNS, and replication validation
- NTFS and share-permission review
- Change management and rollback
- Acceptance testing
- Evidence provenance and SHA-256 integrity verification

## Folder Guide

| Folder | Purpose |
|---|---|
| `00-overview` | Executive, technical, and evidence summaries |
| `01-inventories` | Users, groups, OUs, GPOs, computers, and shares |
| `02-validation` | Domain, DNS, GPO, lifecycle, and automation validation |
| `03-logs` | Operational transcripts |
| `04-security` | AGDLP, delegation, NTFS, and security audit reviews |
| `05-change-management` | RFCs, rollback plans, and post-implementation review |
| `06-runbooks` | Standard operating procedures |
| `07-testing` | Test plan, test matrix, and acceptance report |
| `08-exports` | Structured CSV and TXT evidence |
| `09-evidence-collection` | PowerShell collectors that generate fresh evidence |
| `10-provenance` | Artifact origin, integrity, and verification records |
| `11-cross-reference` | Mapping between tickets, controls, scripts, and evidence |

## Verification Workflow

Run the collection script from an elevated PowerShell session on the domain controller:

```powershell
Set-ExecutionPolicy -Scope Process Bypass
.\09-evidence-collection\Collect-All-Evidence.ps1 `
    -OutputPath C:\LabEvidence `
    -DomainController DC01 `
    -FileServer FS01 `
    -ClientComputer CL01
```

The script exports live evidence and creates a SHA-256 manifest. Compare those files with the acceptance criteria and control mappings in this package.

> All names and business records are fictional portfolio-lab data. The procedures, validation methods, security controls, and evidence collectors mirror enterprise IT operations.
