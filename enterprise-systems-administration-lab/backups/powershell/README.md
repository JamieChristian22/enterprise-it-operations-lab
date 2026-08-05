# PowerShell Automation

Scripts are written for Windows PowerShell 5.1 or PowerShell 7 where the underlying Windows cmdlets are available.

## Examples

```powershell
.\Invoke-FileBackup.ps1 -Source 'D:\Shares' -Destination 'E:\BackupRepository\FS01'
.\New-BackupManifest.ps1 -Path 'E:\BackupRepository\FS01\20260803-220000'
.\Test-BackupIntegrity.ps1 -ManifestCsv '.\backup-manifest.csv' -Repository 'E:\BackupRepository\FS01\20260803-220000'
.\Get-BackupHealthReport.ps1 -Repository 'E:\BackupRepository' -MaximumAgeHours 24
.\Export-BackupEventSummary.ps1 -Hours 24
```

Run with an authorized account and test in a lab before production use. No passwords or secrets are embedded.
