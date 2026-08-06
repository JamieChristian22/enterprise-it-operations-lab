#requires -RunAsAdministrator
[CmdletBinding()]
param(
    [string]$OutputPath = 'C:\ProgramData\Northstar\GPOValidation'
)
$ErrorActionPreference = 'SilentlyContinue'
New-Item -ItemType Directory -Path $OutputPath -Force | Out-Null

$results = [System.Collections.Generic.List[object]]::new()
function Add-Result {
    param([string]$Control,[bool]$Passed,[string]$Observed,[string]$Expected)
    $results.Add([pscustomobject]@{Control=$Control;Passed=$Passed;Observed=$Observed;Expected=$Expected;TestedAt=Get-Date})
}

$fw = Get-NetFirewallProfile
Add-Result 'Firewall-Domain' (($fw | Where-Object Name -eq Domain).Enabled -eq $true) (($fw | Where-Object Name -eq Domain).Enabled) 'True'
Add-Result 'Firewall-Private' (($fw | Where-Object Name -eq Private).Enabled -eq $true) (($fw | Where-Object Name -eq Private).Enabled) 'True'
Add-Result 'Firewall-Public' (($fw | Where-Object Name -eq Public).Enabled -eq $true) (($fw | Where-Object Name -eq Public).Enabled) 'True'

$mp = Get-MpComputerStatus
Add-Result 'Defender-Antivirus' ($mp.AntivirusEnabled -eq $true) $mp.AntivirusEnabled 'True'
Add-Result 'Defender-Realtime' ($mp.RealTimeProtectionEnabled -eq $true) $mp.RealTimeProtectionEnabled 'True'

$screenSaver = Get-ItemProperty 'HKCU:\Software\Policies\Microsoft\Windows\Control Panel\Desktop'
Add-Result 'ScreenSaver-Enabled' ($screenSaver.ScreenSaveActive -eq '1') $screenSaver.ScreenSaveActive '1'
Add-Result 'ScreenSaver-Timeout' ([int]$screenSaver.ScreenSaveTimeOut -le 900 -and [int]$screenSaver.ScreenSaveTimeOut -gt 0) $screenSaver.ScreenSaveTimeOut '1-900 seconds'

$gpEvents = Get-WinEvent -FilterHashtable @{LogName='Microsoft-Windows-GroupPolicy/Operational'; StartTime=(Get-Date).AddHours(-4)}
Add-Result 'Recent-GP-Processing' (($gpEvents | Measure-Object).Count -gt 0) (($gpEvents | Measure-Object).Count) '>0 events in last 4 hours'

$stamp = Get-Date -Format 'yyyyMMdd-HHmmss'
$csv = Join-Path $OutputPath "validation-$stamp.csv"
$results | Export-Csv $csv -NoTypeInformation
$results | Format-Table -AutoSize

$failed = @($results | Where-Object Passed -eq $false).Count
if ($failed -gt 0) { Write-Error "$failed validation control(s) failed. Evidence: $csv"; exit 1 }
Write-Host "All validation controls passed. Evidence: $csv" -ForegroundColor Green
