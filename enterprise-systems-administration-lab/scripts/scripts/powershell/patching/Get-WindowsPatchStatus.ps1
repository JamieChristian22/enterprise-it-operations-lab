#Requires -Version 5.1
[CmdletBinding()]
param([string[]]$ComputerName=@($env:COMPUTERNAME),[string]$OutputPath=".\output\patch-status.csv")
$rows = foreach ($computer in $ComputerName) {
    Invoke-Command -ComputerName $computer -ScriptBlock {
        $latest = Get-HotFix | Sort-Object InstalledOn -Descending | Select-Object -First 1
        $pending = (Test-Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Component Based Servicing\RebootPending') -or
                   (Test-Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\RebootRequired')
        [pscustomobject]@{ComputerName=$env:COMPUTERNAME;LatestHotFix=$latest.HotFixID;InstalledOn=$latest.InstalledOn;RebootPending=$pending}
    }
}
New-Item (Split-Path $OutputPath) -ItemType Directory -Force | Out-Null
$rows | Export-Csv $OutputPath -NoTypeInformation
$rows
