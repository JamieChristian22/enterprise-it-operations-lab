<#
.SYNOPSIS
Checks the age and result of the latest Windows Server Backup recovery point.
#>
[CmdletBinding()]
param(
    [string]$ComputerName = $env:COMPUTERNAME,
    [ValidateRange(1,168)][int]$MaximumAgeHours = 26
)
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
$result = Invoke-Command -ComputerName $ComputerName -ScriptBlock {
    param($MaximumAgeHours)
    Import-Module WindowsServerBackup
    $versions = Get-WBBackupSet -ErrorAction Stop | Sort-Object BackupTime -Descending
    $latest = $versions | Select-Object -First 1
    if (-not $latest) { throw 'No backup recovery points were found.' }
    $age = ((Get-Date) - $latest.BackupTime).TotalHours
    [pscustomobject]@{
        ComputerName   = $env:COMPUTERNAME
        BackupTime     = $latest.BackupTime
        BackupAgeHours = [math]::Round($age, 2)
        MaximumAge     = $MaximumAgeHours
        Status         = if ($age -le $MaximumAgeHours) { 'Pass' } else { 'Fail' }
        VersionId      = $latest.VersionId
    }
} -ArgumentList $MaximumAgeHours
$result
if ($result.Status -eq 'Fail') { exit 1 }
