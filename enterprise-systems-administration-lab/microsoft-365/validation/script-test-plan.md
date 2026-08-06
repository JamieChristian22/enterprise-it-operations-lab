# PowerShell Script Test Plan

| Script | Positive Test | Negative Test | Safety Test |
|---|---|---|---|
| New-M365User.ps1 | Create valid test user | Duplicate UPN rejected | `-WhatIf` makes no changes |
| Disable-M365User.ps1 | Block test user | Unknown user rejected | License retained unless switch supplied |
| New-SharedMailbox.ps1 | Create test mailbox | Duplicate address rejected | `-WhatIf` makes no changes |
| Get-M365LicenseReport.ps1 | Export current SKUs | Invalid output path handled | Read-only |
| Test-M365UserProvisioning.ps1 | All checks pass | Missing group causes failure | Read-only |

## Acceptance Standard

- No hard-coded credentials.
- Destructive changes require explicit parameters.
- Errors stop execution.
- Output clearly identifies success or failure.
- Test objects are removed after validation.
