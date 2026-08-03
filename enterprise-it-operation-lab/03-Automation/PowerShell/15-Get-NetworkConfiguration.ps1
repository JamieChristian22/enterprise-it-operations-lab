[CmdletBinding()] param([string]$Path="$PSScriptRoot\..\Reports\network-config.csv")
Get-NetIPConfiguration|ForEach-Object{[pscustomobject]@{Interface=$_.InterfaceAlias;IPv4=$_.IPv4Address.IPAddress;Gateway=$_.IPv4DefaultGateway.NextHop;DNS=($_.DNSServer.ServerAddresses -join ';')}}|Export-Csv $Path -NoTypeInformation; "Saved $Path"
