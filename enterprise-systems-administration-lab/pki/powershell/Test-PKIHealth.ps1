#Requires -Version 5.1
[CmdletBinding()]
param(
    [string]$CAConfig
)

$ErrorActionPreference = "Stop"
$results = [System.Collections.Generic.List[object]]::new()

function Add-Result {
    param([string]$Check,[bool]$Passed,[string]$Details)
    $results.Add([pscustomobject]@{Check=$Check;Passed=$Passed;Details=$Details})
}

$certSvc = Get-Service CertSvc -ErrorAction SilentlyContinue
Add-Result "Certificate Services running" ($certSvc.Status -eq "Running") $certSvc.Status

$pingOutput = certutil -config "$CAConfig" -ping 2>&1
Add-Result "CA responds to certutil ping" ($LASTEXITCODE -eq 0) ($pingOutput -join " ")

$crl = Get-ChildItem Cert:\LocalMachine\CA -ErrorAction SilentlyContinue
Add-Result "CA trust store available" ($null -ne $crl) "LocalMachine\\CA"

$results
if ($results.Passed -contains $false) { exit 1 }
