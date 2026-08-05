# PowerShell Automation

These scripts require the appropriate Windows Server RSAT modules and should be run from a secured administrative workstation using a named delegated account.

## Safety Controls
- Change-producing scripts support `-WhatIf` through `SupportsShouldProcess`.
- No passwords, API keys, domain administrator credentials, or production secrets are embedded.
- CSV inputs are validated against existing account names before object creation.
- Reports are exported in portable TXT or CSV formats for ticket attachment and review.
- Scripts must be tested against a non-production OU before broader use.

## Included Scripts
- `New-BulkADUsers.ps1` — creates approved users and assigns approved role groups.
- `Get-ADHealthReport.ps1` — collects domain, DC service, and replication health.
- `Disable-InactiveUsers.ps1` — reports, disables, and moves inactive standard users.
- `Export-GroupMembershipAudit.ps1` — exports direct user and nested group membership.
- `Find-AccountLockoutSource.ps1` — searches DC event 4740 records for the source device.
