[CmdletBinding()]
param([string]$DhcpServer='CTS-DHCP01',[int]$WarningPercent=80,[string]$Path="$PSScriptRoot\..\Reports\dhcp-utilization.csv")
$ErrorActionPreference='Stop'; Import-Module DhcpServer
$result=Get-DhcpServerv4ScopeStatistics -ComputerName $DhcpServer|ForEach-Object{[pscustomobject]@{Server=$DhcpServer;ScopeId=$_.ScopeId;InUse=$_.InUse;Free=$_.Free;PercentageInUse=[math]::Round($_.PercentageInUse,1);Status=if($_.PercentageInUse-ge $WarningPercent){'Warning'}else{'Healthy'};Checked=(Get-Date)}}
New-Item (Split-Path $Path) -ItemType Directory -Force|Out-Null;$result|Export-Csv $Path -NoTypeInformation;$result
