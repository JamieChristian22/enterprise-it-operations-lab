#requires -RunAsAdministrator
[CmdletBinding()]
param(
    [string]$OutputPath = 'C:\ProgramData\Northstar\GPOEvidence'
)
$ErrorActionPreference = 'Continue'
New-Item -ItemType Directory -Path $OutputPath -Force | Out-Null
$stamp = Get-Date -Format 'yyyyMMdd-HHmmss'

gpupdate /force | Out-File (Join-Path $OutputPath "gpupdate-$stamp.txt")
gpresult /h (Join-Path $OutputPath "gpresult-$stamp.html") /f
gpresult /r /scope computer | Out-File (Join-Path $OutputPath "gpresult-computer-$stamp.txt")
gpresult /r /scope user | Out-File (Join-Path $OutputPath "gpresult-user-$stamp.txt")
auditpol /get /category:* | Out-File (Join-Path $OutputPath "audit-policy-$stamp.txt")
Get-NetFirewallProfile | Format-List * | Out-File (Join-Path $OutputPath "firewall-$stamp.txt")
Get-MpComputerStatus | Select-Object AntivirusEnabled, RealTimeProtectionEnabled, BehaviorMonitorEnabled, NISEnabled, AntivirusSignatureLastUpdated |
    Export-Csv (Join-Path $OutputPath "defender-$stamp.csv") -NoTypeInformation
Get-WinEvent -LogName 'Microsoft-Windows-GroupPolicy/Operational' -MaxEvents 100 |
    Export-Csv (Join-Path $OutputPath "group-policy-events-$stamp.csv") -NoTypeInformation
Write-Host "Client evidence saved to $OutputPath" -ForegroundColor Green
