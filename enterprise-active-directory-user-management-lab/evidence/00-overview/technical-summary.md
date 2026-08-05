# Technical Summary

| Component | Implementation |
|---|---|
| Domain | `corp.contoso.local` |
| NetBIOS | `CONTOSO` |
| Domain Controller | `DC01` |
| Client | `CL01` |
| Identity Store | Active Directory Domain Services |
| Name Resolution | Active Directory-integrated DNS |
| Access Model | AGDLP |
| Automation | PowerShell |
| Policy | Group Policy |
| File Services | SMB shares with NTFS permissions |
| Audit Scope | Account management, logon events, directory service changes |

## Object Counts
- Users: 75
- Security groups: 18
- OUs: 12
- GPOs: 6
- Shares: 9
