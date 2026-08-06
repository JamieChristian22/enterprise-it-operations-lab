# PowerShell Logging

Enable:

- Module Logging
- Script Block Logging
- PowerShell Transcription
- Protected Event Logging where supported

## Group Policy Paths

- Windows Components > Windows PowerShell > Turn on Module Logging
- Windows Components > Windows PowerShell > Turn on PowerShell Script Block Logging
- Windows Components > Windows PowerShell > Turn on PowerShell Transcription

## Validation

```powershell
Get-WinEvent -LogName Microsoft-Windows-PowerShell/Operational -MaxEvents 20
Get-ItemProperty HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging
```
