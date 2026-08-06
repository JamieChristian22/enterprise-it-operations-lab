#Requires -Version 5.1
[CmdletBinding()]
param(
    [string]$OutputPath = ".\output\ad-health.txt"
)

$lines = @()
$lines += "Active Directory Health Report"
$lines += "Generated: $(Get-Date -Format o)"
$lines += ""
$lines += "DCDIAG"
$lines += (dcdiag /q 2>&1)
$lines += ""
$lines += "Replication"
$lines += (repadmin /replsummary 2>&1)

New-Item (Split-Path $OutputPath) -ItemType Directory -Force | Out-Null
$lines | Set-Content $OutputPath
$lines
