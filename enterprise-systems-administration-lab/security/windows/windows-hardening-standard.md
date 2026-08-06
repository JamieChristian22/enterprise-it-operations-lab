# Windows Hardening Standard

## Core Controls

- Microsoft Defender enabled and current
- Tamper Protection enabled where managed
- Windows Firewall enabled for all profiles
- Advanced Audit Policy configured
- PowerShell Script Block and Module Logging enabled
- Windows LAPS deployed
- SMBv1 disabled
- SMB signing required where supported
- Guest access disabled
- Local administrator membership restricted
- RDP limited to approved administrators
- Credential protections enabled where supported
- Legacy protocols removed

## Validation

```powershell
Get-MpComputerStatus
Get-NetFirewallProfile
auditpol /get /category:*
Get-WindowsOptionalFeature -Online -FeatureName SMB1Protocol
Get-LocalGroupMember Administrators
```
