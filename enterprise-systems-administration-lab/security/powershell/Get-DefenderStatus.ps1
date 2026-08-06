#Requires -Version 5.1
[CmdletBinding()]
param([string]$OutputPath=".\output\defender-status.json")
$status=Get-MpComputerStatus
$pref=Get-MpPreference
$result=[pscustomobject]@{
 AntivirusEnabled=$status.AntivirusEnabled
 RealTimeProtectionEnabled=$status.RealTimeProtectionEnabled
 BehaviorMonitorEnabled=$status.BehaviorMonitorEnabled
 SignatureAge=$status.AntivirusSignatureAge
 Exclusions=($pref.ExclusionPath -join "; ")
}
New-Item (Split-Path $OutputPath) -ItemType Directory -Force|Out-Null
$result|ConvertTo-Json|Set-Content $OutputPath
$result
