# PowerShell Usage Guide

## Requirements

- Windows PowerShell 5.1 or PowerShell 7 with Windows compatibility
- ActiveDirectory module
- Elevated session
- Domain connectivity
- Appropriate delegated rights

## Script Order

| Order | Script | Purpose |
|---:|---|---|
| 0 | `00-PrerequisiteCheck.ps1` | Validate environment and modules |
| 1 | `01-Build-OU-Structure.ps1` | Create OU hierarchy |
| 2 | `02-New-ADSecurityGroups.ps1` | Create role/resource groups and nesting |
| 3 | `03-New-BulkADUsers.ps1` | Provision sample users |
| 4 | `04-New-DepartmentShares.ps1` | Create SMB shares and NTFS ACLs |
| 5 | `05-Reset-UserPassword.ps1` | Reset and unlock a user safely |
| 6 | `06-New-EmployeeOnboarding.ps1` | Execute one complete onboarding |
| 7 | `07-Disable-EmployeeOffboarding.ps1` | Execute controlled offboarding |
| 8 | `08-Manage-GroupMembership.ps1` | Add/remove approved role membership |
| 9 | `09-Invoke-LabValidation.ps1` | Validate desired state |
| 10 | `10-Export-ADAuditReport.ps1` | Export governance reports |

## Standard Invocation

```powershell
Set-ExecutionPolicy -Scope Process RemoteSigned
Set-Location C:\IT-Lab\enterprise-active-directory-user-management-lab
.\scripts\00-PrerequisiteCheck.ps1
```

## Onboarding Example

```powershell
.\scripts\06-New-EmployeeOnboarding.ps1 `
  -FirstName 'Alicia' `
  -LastName 'Morgan' `
  -Department 'Finance' `
  -Title 'Financial Analyst' `
  -ManagerSamAccountName 'maya.patel' `
  -TicketNumber 'INC-2026-1031' `
  -TemporaryPassword (Read-Host 'Temporary password' -AsSecureString)
```

## Offboarding Example

First preview:

```powershell
.\scripts\07-Disable-EmployeeOffboarding.ps1 `
  -SamAccountName 'ethan.brooks' `
  -TicketNumber 'REQ-2026-1044' `
  -EffectiveDate '2026-08-05' `
  -WhatIf
```

Then execute:

```powershell
.\scripts\07-Disable-EmployeeOffboarding.ps1 `
  -SamAccountName 'ethan.brooks' `
  -TicketNumber 'REQ-2026-1044' `
  -EffectiveDate '2026-08-05' `
  -ConfirmExecution
```

## Logging

Each script writes to `evidence/logs`. Logs contain timestamps, account names, actions, outcomes, and errors. Passwords and secure strings are never logged.

## Error Handling

Scripts stop on errors and return a nonzero exit code where appropriate. Review the most recent log, fix the underlying condition, and rerun only after confirming the previous partial state.
