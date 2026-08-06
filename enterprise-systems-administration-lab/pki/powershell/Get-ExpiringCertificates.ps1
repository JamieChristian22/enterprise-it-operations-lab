#Requires -Version 5.1
[CmdletBinding()]
param(
    [int]$Days = 30,
    [string]$OutputPath = ".\reports\expiring-certificates.csv"
)

$cutoff = (Get-Date).AddDays($Days)

$certs = Get-ChildItem Cert:\LocalMachine\My |
    Where-Object { $_.NotAfter -le $cutoff } |
    Select-Object Subject, Thumbprint, NotBefore, NotAfter,
        @{Name='DaysRemaining';Expression={[math]::Floor(($_.NotAfter - (Get-Date)).TotalDays)}}

$certs | Export-Csv -Path $OutputPath -NoTypeInformation
$certs
