#requires -Modules ActiveDirectory,DnsServer
[CmdletBinding()] param([string]$OutputPath=".\ad-health-report.txt")
$ErrorActionPreference='Stop'; $lines=[System.Collections.Generic.List[string]]::new()
$domain=Get-ADDomain; $forest=Get-ADForest; $dcs=Get-ADDomainController -Filter *
$lines.Add("ACTIVE DIRECTORY HEALTH REPORT");$lines.Add("Generated: $(Get-Date -Format o)");$lines.Add("Domain: $($domain.DNSRoot)");$lines.Add("Forest mode: $($forest.ForestMode)")
foreach($dc in $dcs){$svc=Get-Service -ComputerName $dc.HostName -Name NTDS,DNS -ErrorAction SilentlyContinue;$lines.Add("$($dc.HostName) IP=$($dc.IPv4Address) GC=$($dc.IsGlobalCatalog) Services=$($svc.Status -join ',')")}
$rep=& repadmin /replsummary 2>&1; $lines.Add('');$lines.Add('REPLICATION');$rep|ForEach-Object{$lines.Add($_)}
$lines|Set-Content -Encoding utf8 $OutputPath; Get-Item $OutputPath
