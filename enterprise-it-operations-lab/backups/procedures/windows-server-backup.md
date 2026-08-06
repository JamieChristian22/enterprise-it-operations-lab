# Windows Server Backup Procedure

## Scope

- Volumes
- File shares
- System state
- Application-consistent data where supported

## Commands

```powershell
Install-WindowsFeature Windows-Server-Backup
Get-WBPolicy
Get-WBSummary
Get-WBJob -Previous 1
```

## Validation

- Backup job successful
- Recovery point visible
- Required volumes included
- Test restore completed
- ACLs preserved
