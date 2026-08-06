[CmdletBinding()]
param([string]$DomainController='DR-DC01')
$tests = @()
$tests += [pscustomobject]@{Check='Ping';Passed=(Test-Connection $DomainController -Count 1 -Quiet)}
try { Resolve-DnsName $DomainController -ErrorAction Stop | Out-Null; $dns=$true } catch { $dns=$false }
$tests += [pscustomobject]@{Check='DNS';Passed=$dns}
try { Test-NetConnection $DomainController -Port 389 -InformationLevel Quiet -ErrorAction Stop | Out-Null; $ldap=$true } catch { $ldap=$false }
$tests += [pscustomobject]@{Check='LDAP';Passed=$ldap}
$tests | Format-Table -AutoSize
if ($tests.Passed -contains $false) { exit 2 }
