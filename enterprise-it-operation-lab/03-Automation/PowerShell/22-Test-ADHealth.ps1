[CmdletBinding()]
param([string]$OutputPath="$PSScriptRoot\..\Reports\ad-health.json")
$ErrorActionPreference='Stop'; Import-Module ActiveDirectory
$failures = @(Get-ADReplicationFailure -Target * -Scope Forest -ErrorAction Stop)
$dcs = @(Get-ADDomainController -Filter * | Sort-Object HostName)
$results = foreach($dc in $dcs){
  $services = Get-Service -ComputerName $dc.HostName -Name NTDS,DNS,Netlogon,KDC -ErrorAction SilentlyContinue
  [pscustomobject]@{DomainController=$dc.HostName;Site=$dc.Site;IPv4=$dc.IPv4Address;IsGlobalCatalog=$dc.IsGlobalCatalog;ServicesHealthy=(@($services|Where-Object Status -ne Running).Count -eq 0);ReplicationFailures=@($failures|Where-Object Server -like "*$($dc.HostName)*").Count}
}
$payload=[ordered]@{CheckedAt=(Get-Date).ToString('o');Domain=(Get-ADDomain).DNSRoot;Forest=(Get-ADForest).Name;Healthy=(@($results|Where-Object{-not $_.ServicesHealthy -or $_.ReplicationFailures -gt 0}).Count -eq 0);DomainControllers=$results}
New-Item (Split-Path $OutputPath) -ItemType Directory -Force|Out-Null; $payload|ConvertTo-Json -Depth 5|Set-Content $OutputPath -Encoding UTF8; $payload
