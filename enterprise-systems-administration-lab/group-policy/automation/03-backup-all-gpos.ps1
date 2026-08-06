#requires -Modules GroupPolicy
[CmdletBinding()]
param(
    [string]$BackupRoot = 'C:\GPO-Backups'
)
$ErrorActionPreference = 'Stop'
$datedPath = Join-Path $BackupRoot (Get-Date -Format 'yyyy-MM-dd_HHmmss')
New-Item -ItemType Directory -Path $datedPath -Force | Out-Null

$results = foreach ($gpo in Get-GPO -All | Sort-Object DisplayName) {
    $backup = Backup-GPO -Guid $gpo.Id -Path $datedPath -Comment "Automated backup before approved change"
    [pscustomobject]@{
        GPOName  = $gpo.DisplayName
        GPOId    = $gpo.Id
        BackupId = $backup.Id
        Path     = $datedPath
        Time     = Get-Date
    }
}
$results | Export-Csv (Join-Path $datedPath 'backup-manifest.csv') -NoTypeInformation
Get-GPOReport -All -ReportType Html -Path (Join-Path $datedPath 'all-gpos-report.html')
Write-Host "Backed up $($results.Count) GPOs to $datedPath" -ForegroundColor Green
