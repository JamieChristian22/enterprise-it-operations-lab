#requires -Modules GroupPolicy
[CmdletBinding()]
param(
    [string]$OutputPath = (Join-Path $PSScriptRoot '..\evidence\exports')
)
$ErrorActionPreference = 'Stop'
New-Item -ItemType Directory -Path $OutputPath -Force | Out-Null

foreach ($gpo in Get-GPO -All | Sort-Object DisplayName) {
    $safeName = ($gpo.DisplayName -replace '[^a-zA-Z0-9._-]', '_')
    Get-GPOReport -Guid $gpo.Id -ReportType Html -Path (Join-Path $OutputPath "$safeName.html")
    Get-GPOReport -Guid $gpo.Id -ReportType Xml -Path (Join-Path $OutputPath "$safeName.xml")
}
Get-GPO -All | Select-Object DisplayName, Id, GpoStatus, Owner, CreationTime, ModificationTime |
    Export-Csv (Join-Path $OutputPath 'gpo-summary.csv') -NoTypeInformation
Write-Host "GPO reports exported to $OutputPath" -ForegroundColor Green
