[CmdletBinding()]
param(
    [Parameter(Mandatory)][string]$OutputPath,
    [string]$DomainController = "DC01",
    [string]$FileServer = "FS01",
    [string]$ClientComputer = "CL01"
)

dcdiag /v | Out-File (Join-Path $OutputPath "dcdiag-live.txt") -Encoding utf8
repadmin /replsummary | Out-File (Join-Path $OutputPath "repadmin-replsummary-live.txt") -Encoding utf8
repadmin /showrepl $DomainController | Out-File (Join-Path $OutputPath "repadmin-showrepl-live.txt") -Encoding utf8
Get-Service NTDS,DNS,KDC,Netlogon,W32Time |
    Select-Object Name,Status,StartType |
    Export-Csv (Join-Path $OutputPath "domain-services-live.csv") -NoTypeInformation
