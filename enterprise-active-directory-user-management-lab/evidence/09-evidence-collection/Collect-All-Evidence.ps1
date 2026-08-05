[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [string]$OutputPath,

    [string]$DomainController = "DC01",
    [string]$FileServer = "FS01",
    [string]$ClientComputer = "CL01"
)

$ErrorActionPreference = "Stop"
$timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
$bundle = Join-Path $OutputPath "AD-Evidence-$timestamp"
New-Item -ItemType Directory -Path $bundle -Force | Out-Null

$collectors = @(
    "Export-ADInventory.ps1",
    "Export-GPOEvidence.ps1",
    "Export-DomainHealth.ps1",
    "Export-DNSEvidence.ps1",
    "Export-FilePermissions.ps1",
    "Export-DelegationEvidence.ps1",
    "Export-AuditEvents.ps1",
    "Export-ClientPolicyResult.ps1"
)

foreach ($collector in $collectors) {
    $path = Join-Path $PSScriptRoot $collector
    Write-Host "Running $collector..."
    & $path -OutputPath $bundle `
        -DomainController $DomainController `
        -FileServer $FileServer `
        -ClientComputer $ClientComputer
}

& (Join-Path $PSScriptRoot "New-EvidenceManifest.ps1") -OutputPath $bundle
Write-Host "Evidence bundle created: $bundle"
