#Requires -Version 5.1
[CmdletBinding()]
param([string]$OutputPath = ".\output\ad-health.json")
$ErrorActionPreference = "Stop"
$results = [System.Collections.Generic.List[object]]::new()
function Add-Check([string]$Name,[bool]$Passed,[string]$Details) {
    $results.Add([pscustomobject]@{Check=$Name;Passed=$Passed;Details=$Details;Timestamp=(Get-Date).ToString("o")})
}
foreach ($name in "NTDS","DNS","Netlogon","KDC") {
    $service = Get-Service $name -ErrorAction SilentlyContinue
    Add-Check "Service $name" ($service.Status -eq "Running") ([string]$service.Status)
}
$dcdiag = dcdiag /q 2>&1
Add-Check "DCDIAG" ([string]::IsNullOrWhiteSpace(($dcdiag -join ""))) ($dcdiag -join "`n")
$repl = repadmin /replsummary 2>&1
Add-Check "Replication" (-not (($repl -join "`n") -match "fails|error")) ($repl -join "`n")
New-Item (Split-Path $OutputPath) -ItemType Directory -Force | Out-Null
$results | ConvertTo-Json -Depth 4 | Set-Content $OutputPath
$results
if ($results.Passed -contains $false) { exit 1 }
