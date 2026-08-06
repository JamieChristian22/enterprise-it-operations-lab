[CmdletBinding()]
param([string]$Domain='corp.northstar.local')
$dns=Resolve-DnsName $Domain -ErrorAction SilentlyContinue
$dc=Get-ADDomainController -Discover -DomainName $Domain -ErrorAction SilentlyContinue
[pscustomobject]@{Domain=$Domain;DnsResolved=[bool]$dns;DomainController=$dc.HostName;Site=$dc.Site}
