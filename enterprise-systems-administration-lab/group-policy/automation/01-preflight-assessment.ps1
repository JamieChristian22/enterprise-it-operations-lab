#requires -Modules ActiveDirectory, GroupPolicy
[CmdletBinding()]
param(
    [string]$OutputPath = (Join-Path $PSScriptRoot '..\evidence\preflight')
)
$ErrorActionPreference = 'Stop'
New-Item -ItemType Directory -Path $OutputPath -Force | Out-Null
$stamp = Get-Date -Format 'yyyyMMdd-HHmmss'

$domain = Get-ADDomain
$forest = Get-ADForest
$dc = Get-ADDomainController -Discover
$gpos = Get-GPO -All | Sort-Object DisplayName

[pscustomobject]@{
    AssessmentTime = Get-Date
    Domain          = $domain.DNSRoot
    Forest          = $forest.Name
    PDCEmulator     = $domain.PDCEmulator
    DiscoveredDC    = $dc.HostName
    DomainMode      = $domain.DomainMode
    ForestMode      = $forest.ForestMode
    GPOCount        = $gpos.Count
} | Export-Csv (Join-Path $OutputPath "environment-$stamp.csv") -NoTypeInformation

$gpos | Select-Object DisplayName, Id, GpoStatus, CreationTime, ModificationTime, Owner |
    Export-Csv (Join-Path $OutputPath "gpo-inventory-$stamp.csv") -NoTypeInformation

Get-GPOReport -All -ReportType Html -Path (Join-Path $OutputPath "all-gpos-$stamp.html")
Write-Host "Preflight evidence written to $OutputPath" -ForegroundColor Green
