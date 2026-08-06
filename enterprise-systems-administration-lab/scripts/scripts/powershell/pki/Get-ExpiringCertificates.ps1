#Requires -Version 5.1
[CmdletBinding()]
param([int]$Days=30,[string]$OutputPath=".\output\expiring-certificates.csv")
$cutoff=(Get-Date).AddDays($Days)
$rows=Get-ChildItem Cert:\LocalMachine\My | Where-Object NotAfter -LE $cutoff |
 Select-Object Subject,Thumbprint,NotAfter,@{Name="DaysRemaining";Expression={[math]::Floor(($_.NotAfter-(Get-Date)).TotalDays)}}
New-Item (Split-Path $OutputPath) -ItemType Directory -Force | Out-Null
$rows|Export-Csv $OutputPath -NoTypeInformation
$rows
