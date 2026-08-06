<#
.SYNOPSIS
Validates required Windows Server security and operational baseline controls.
.PARAMETER ComputerName
Target server.
.PARAMETER ExportPath
Optional JSON output path.
#>
[CmdletBinding()]
param(
    [string]$ComputerName = $env:COMPUTERNAME,
    [string]$ExportPath
)
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$checks = Invoke-Command -ComputerName $ComputerName -ScriptBlock {
    $items = [System.Collections.Generic.List[object]]::new()
    function Add-Check([string]$Id,[string]$Control,[bool]$Passed,[string]$Observed,[string]$Expected) {
        $items.Add([pscustomobject]@{ Id=$Id; Control=$Control; Status=if($Passed){'Pass'}else{'Fail'}; Observed=$Observed; Expected=$Expected })
    }

    $profiles = Get-NetFirewallProfile
    Add-Check 'WS-01' 'Windows Firewall profiles enabled' (-not ($profiles.Enabled -contains $false)) (($profiles | ForEach-Object { "$($_.Name)=$($_.Enabled)" }) -join '; ') 'All profiles enabled'

    $nla = (Get-ItemProperty 'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp' -Name UserAuthentication).UserAuthentication
    Add-Check 'WS-02' 'RDP Network Level Authentication' ($nla -eq 1) "UserAuthentication=$nla" '1'

    $smb1 = Get-WindowsOptionalFeature -Online -FeatureName SMB1Protocol
    Add-Check 'WS-04' 'SMBv1 disabled' ($smb1.State -ne 'Enabled') $smb1.State 'Disabled or Removed'

    $guest = Get-LocalUser -Name Guest
    Add-Check 'WS-05' 'Guest account disabled' (-not $guest.Enabled) "Enabled=$($guest.Enabled)" 'False'

    $defender = Get-MpComputerStatus
    Add-Check 'WS-09' 'Defender real-time protection' $defender.RealTimeProtectionEnabled "Enabled=$($defender.RealTimeProtectionEnabled)" 'True'

    foreach ($serviceName in 'EventLog','WinRM','W32Time') {
        $service = Get-Service $serviceName
        Add-Check "SVC-$serviceName" "Required service $serviceName" ($service.Status -eq 'Running') ([string]$service.Status) 'Running'
    }

    foreach ($disk in Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3") {
        $free = [math]::Round(($disk.FreeSpace / $disk.Size) * 100, 1)
        Add-Check "DISK-$($disk.DeviceID)" "Free space $($disk.DeviceID)" ($free -ge 20) "$free%" '>=20%'
    }
    $items
}

$result = [pscustomobject]@{
    ComputerName = $ComputerName
    CollectedAt  = (Get-Date).ToString('o')
    Passed       = @($checks | Where-Object Status -eq 'Pass').Count
    Failed       = @($checks | Where-Object Status -eq 'Fail').Count
    Overall      = if ($checks.Status -contains 'Fail') { 'Fail' } else { 'Pass' }
    Checks       = $checks
}

if ($ExportPath) {
    $parent = Split-Path $ExportPath -Parent
    if ($parent) { New-Item -ItemType Directory -Path $parent -Force | Out-Null }
    $result | ConvertTo-Json -Depth 5 | Set-Content $ExportPath -Encoding UTF8
}
$result
if ($result.Overall -eq 'Fail') { exit 1 }
