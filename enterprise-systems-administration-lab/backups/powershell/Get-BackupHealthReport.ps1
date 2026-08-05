[CmdletBinding()]
param(
    [Parameter(Mandatory)] [string]$Repository,
    [int]$MaximumAgeHours = 24,
    [string]$OutputCsv = ".\backup-health-report.csv"
)
$ErrorActionPreference = 'Stop'
if (-not (Test-Path $Repository)) { throw "Repository not found: $Repository" }
$cutoff = (Get-Date).AddHours(-$MaximumAgeHours)
$files = Get-ChildItem $Repository -File -Recurse
$latest = $files | Sort-Object LastWriteTime -Descending | Select-Object -First 1
$drive = Get-PSDrive -Name ([IO.Path]::GetPathRoot((Resolve-Path $Repository)).TrimEnd(':\'))
$result = [pscustomobject]@{
    CheckedAt = Get-Date
    Repository = (Resolve-Path $Repository).Path
    LatestBackup = $latest.FullName
    LatestWriteTime = $latest.LastWriteTime
    WithinRPO = [bool]($latest -and $latest.LastWriteTime -ge $cutoff)
    FileCount = $files.Count
    UsedGB = [math]::Round((($files | Measure-Object Length -Sum).Sum / 1GB),2)
    FreeGB = [math]::Round(($drive.Free / 1GB),2)
}
$result | Export-Csv $OutputCsv -NoTypeInformation
$result
