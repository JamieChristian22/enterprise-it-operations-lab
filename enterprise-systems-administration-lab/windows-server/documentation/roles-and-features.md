# Roles and Features
```powershell
Install-WindowsFeature FS-FileServer,FS-Resource-Manager -IncludeManagementTools
Install-WindowsFeature Print-Server -IncludeManagementTools
Install-WindowsFeature Windows-Server-Backup
Get-WindowsFeature | Where InstallState -eq Installed
```
