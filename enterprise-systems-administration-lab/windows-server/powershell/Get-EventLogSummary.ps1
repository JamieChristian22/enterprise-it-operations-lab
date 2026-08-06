[CmdletBinding()]
param([string]$ComputerName=$env:COMPUTERNAME,[ValidateRange(1,168)][int]$Hours=24)
Set-StrictMode -Version Latest
$ErrorActionPreference='Stop'
Invoke-Command -ComputerName $ComputerName -ScriptBlock {
    param($Hours)
    Get-WinEvent -FilterHashtable @{LogName=@('System','Application');Level=1,2,3;StartTime=(Get-Date).AddHours(-$Hours)} -ErrorAction SilentlyContinue |
    Group-Object LogName,ProviderName,Id,LevelDisplayName | Sort-Object Count -Descending |
    Select-Object Count,@{n='Log';e={$_.Group[0].LogName}},@{n='Provider';e={$_.Group[0].ProviderName}},@{n='EventId';e={$_.Group[0].Id}},@{n='Level';e={$_.Group[0].LevelDisplayName}} -First 25
} -ArgumentList $Hours
