# Audit and PowerShell Logging Implementation

## Controls

Configure Advanced Audit Policy under Computer Configuration → Policies → Windows Settings → Security Settings → Advanced Audit Policy Configuration.

Enable:

- Account Management: Success and Failure
- Logon: Success and Failure
- Special Logon: Success
- Process Creation: Success
- Audit Policy Change: Success and Failure
- System Integrity: Success and Failure

Enable PowerShell:

- Script Block Logging
- Module Logging for `*`
- Transcription to `\\NS-FS01\PowerShellTranscripts$`

The transcript share must grant endpoint computer accounts write-only creation rights and restrict read access to Security Administrators.

## Validation

```powershell
auditpol /get /category:*
Get-WinEvent -LogName 'Microsoft-Windows-PowerShell/Operational' -MaxEvents 20
```
