[CmdletBinding()]
param([int]$Hours=24,[string[]]$DomainController='CTS-DC01','CTS-DC02',[string]$Path="$PSScriptRoot\..\Reports\privileged-group-events.csv")
$start=(Get-Date).AddHours(-$Hours);$ids=4728,4729,4732,4733,4756,4757
$result=foreach($dc in $DomainController){Get-WinEvent -ComputerName $dc -FilterHashtable @{LogName='Security';Id=$ids;StartTime=$start} -ErrorAction SilentlyContinue|ForEach-Object{[pscustomobject]@{DomainController=$dc;TimeCreated=$_.TimeCreated;EventId=$_.Id;RecordId=$_.RecordId;Message=($_.Message -replace "`r?`n",' ')}}}
New-Item (Split-Path $Path) -ItemType Directory -Force|Out-Null;$result|Export-Csv $Path -NoTypeInformation;$result
