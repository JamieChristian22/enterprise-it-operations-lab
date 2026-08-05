[CmdletBinding()]
param(
    [Parameter(Mandatory)][string]$OutputPath,
    [string]$DomainController = "DC01",
    [string]$FileServer = "FS01",
    [string]$ClientComputer = "CL01"
)

$eventIds = 4720,4722,4725,4726,4728,4729,4732,4733,4740,4767
$events = Get-WinEvent -ComputerName $DomainController -FilterHashtable @{
    LogName = "Security"
    Id = $eventIds
    StartTime = (Get-Date).AddDays(-30)
} -ErrorAction SilentlyContinue

$events |
    Select-Object TimeCreated,Id,MachineName,ProviderName,Message |
    Export-Csv (Join-Path $OutputPath "security-account-events-live.csv") -NoTypeInformation
