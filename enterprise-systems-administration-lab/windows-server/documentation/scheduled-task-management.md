# Scheduled Task Management
Use descriptive names, least-privilege identities, logged output, and failure handling.
```powershell
$action=New-ScheduledTaskAction -Execute PowerShell.exe -Argument '-NoProfile -File C:\Ops\Get-ServerHealth.ps1'
$trigger=New-ScheduledTaskTrigger -Daily -At 6am
Register-ScheduledTask -TaskName 'Northstar Server Health Report' -Action $action -Trigger $trigger -RunLevel Highest
```
