#Requires -Version 5.1
[CmdletBinding()]
param([string]$OutputPath=".\output\windows-security-baseline.json")
$ErrorActionPreference="Stop"
$results=[System.Collections.Generic.List[object]]::new()
function Add-Check([string]$Name,[bool]$Passed,[string]$Details){
 $results.Add([pscustomobject]@{Check=$Name;Passed=$Passed;Details=$Details;Timestamp=(Get-Date).ToString("o")})
}
$mp=Get-MpComputerStatus
Add-Check "Defender real-time protection" $mp.RealTimeProtectionEnabled ([string]$mp.RealTimeProtectionEnabled)
foreach($profile in Get-NetFirewallProfile){
 Add-Check "Firewall $($profile.Name)" $profile.Enabled ([string]$profile.Enabled)
}
$smb1=Get-WindowsOptionalFeature -Online -FeatureName SMB1Protocol -ErrorAction SilentlyContinue
Add-Check "SMBv1 disabled" ($smb1.State -ne "Enabled") ([string]$smb1.State)
$admins=Get-LocalGroupMember Administrators -ErrorAction SilentlyContinue
Add-Check "Local administrators enumerated" ($null -ne $admins) (($admins.Name)-join "; ")
New-Item (Split-Path $OutputPath) -ItemType Directory -Force|Out-Null
$results|ConvertTo-Json -Depth 4|Set-Content $OutputPath
$results
if($results.Passed -contains $false){exit 1}
