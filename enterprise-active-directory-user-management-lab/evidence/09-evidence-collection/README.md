# Evidence Collection Toolkit

These scripts generate fresh, machine-readable evidence from the running Active Directory lab.

## Prerequisites

- Windows PowerShell 5.1 or PowerShell 7
- ActiveDirectory module
- GroupPolicy module
- Administrator or appropriately delegated credentials
- Network access to `DC01`, `FS01`, and `CL01`

## Primary Script

`Collect-All-Evidence.ps1` runs every collector and writes a timestamped evidence bundle.

## Individual Collectors

- `Export-ADInventory.ps1`
- `Export-GPOEvidence.ps1`
- `Export-DomainHealth.ps1`
- `Export-DNSEvidence.ps1`
- `Export-FilePermissions.ps1`
- `Export-DelegationEvidence.ps1`
- `Export-AuditEvents.ps1`
- `Export-ClientPolicyResult.ps1`
- `New-EvidenceManifest.ps1`

The collectors are read-only except for creating output files.
