# File Services
Use role-based AD groups for share and NTFS permissions.
```powershell
New-SmbShare -Name Finance -Path D:\Shares\Finance -ChangeAccess NORTHSTAR\DL-Finance-Modify -ReadAccess NORTHSTAR\DL-Finance-Read
Get-SmbShareAccess Finance
Get-Acl D:\Shares\Finance
```
