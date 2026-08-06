[CmdletBinding()]param([string]$OutputPath='.\output\baseline.json')
$results=[System.Collections.Generic.List[object]]::new();function Add-Check($Check,$Passed,$Details){$results.Add([pscustomobject]@{Check=$Check;Passed=$Passed;Details=$Details})}
foreach($p in Get-NetFirewallProfile){Add-Check "Firewall $($p.Name)" $p.Enabled ([string]$p.Enabled)}
foreach($n in 'WinRM','W32Time','LanmanServer','EventLog'){$s=Get-Service $n -ErrorAction SilentlyContinue;Add-Check "Service $n" ($s.Status -eq 'Running') ([string]$s.Status)}
$nla=(Get-ItemProperty 'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp' -Name UserAuthentication).UserAuthentication;Add-Check 'RDP NLA enabled' ($nla -eq 1) ([string]$nla)
New-Item (Split-Path $OutputPath) -ItemType Directory -Force|Out-Null;$results|ConvertTo-Json|Set-Content $OutputPath;$results;if($results.Passed -contains $false){exit 1}
