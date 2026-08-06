#Requires -Version 5.1
[CmdletBinding()]
param([string]$OutputPath = ".\output\windows-backup-report.csv")

$jobs = Get-WBJob -Previous 20 -ErrorAction SilentlyContinue |
    Select-Object StartTime, EndTime, JobState, HResult, ErrorDescription

New-Item (Split-Path $OutputPath) -ItemType Directory -Force | Out-Null
$jobs | Export-Csv $OutputPath -NoTypeInformation
$jobs
