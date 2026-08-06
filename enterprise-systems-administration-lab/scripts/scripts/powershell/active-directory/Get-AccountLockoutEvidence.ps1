#Requires -Version 5.1
[CmdletBinding()]
param([Parameter(Mandatory)][string]$SamAccountName,[int]$Hours=24,[string]$OutputPath=".\output\lockout.csv")
$events = Get-WinEvent -FilterHashtable @{LogName="Security";Id=4740;StartTime=(Get-Date).AddHours(-$Hours)} `
    -ErrorAction SilentlyContinue | Where-Object Message -Match ([regex]::Escape($SamAccountName)) |
    Select-Object TimeCreated,Id,MachineName,Message
New-Item (Split-Path $OutputPath) -ItemType Directory -Force | Out-Null
$events | Export-Csv $OutputPath -NoTypeInformation
$events
