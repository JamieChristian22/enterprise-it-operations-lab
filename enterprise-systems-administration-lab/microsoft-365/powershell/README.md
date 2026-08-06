# PowerShell Automation

## Required Modules

```powershell
Install-Module Microsoft.Graph -Scope CurrentUser
Install-Module ExchangeOnlineManagement -Scope CurrentUser
Install-Module MicrosoftTeams -Scope CurrentUser
Install-Module Microsoft.Online.SharePoint.PowerShell -Scope CurrentUser
```

## Included Scripts

| Script | Purpose |
|---|---|
| `Connect-M365Services.ps1` | Connect to Microsoft Graph and Exchange Online |
| `New-M365User.ps1` | Create, license, and group a user |
| `Disable-M365User.ps1` | Block sign-in, revoke sessions, preserve mailbox, and remove licenses |
| `New-SharedMailbox.ps1` | Create shared mailbox and assign permissions |
| `Get-M365LicenseReport.ps1` | Report enabled, consumed, and available licenses |
| `Get-PrivilegedRoleReport.ps1` | Export privileged role assignments |
| `Get-GuestAccessReport.ps1` | Export guest accounts |
| `Get-MailboxForwardingReport.ps1` | Find mailbox-level forwarding |
| `Test-M365UserProvisioning.ps1` | Validate user provisioning |

Use `-WhatIf` with scripts that support it before making changes.
