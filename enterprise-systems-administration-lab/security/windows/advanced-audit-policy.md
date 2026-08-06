# Windows Advanced Audit Policy

## Recommended Categories

- Account Logon
- Account Management
- Directory Service Access
- Logon/Logoff
- Object Access
- Policy Change
- Privilege Use
- System
- Detailed Tracking

## High-Value Events

| Event ID | Meaning |
|---|---|
| 4624 | Successful logon |
| 4625 | Failed logon |
| 4672 | Special privileges assigned |
| 4720 | User account created |
| 4728 / 4732 | Added to privileged group |
| 4740 | Account locked out |
| 1102 | Audit log cleared |
| 4688 | Process creation |

## Validation

```powershell
auditpol /get /category:*
Get-WinEvent -LogName Security -MaxEvents 20
```
