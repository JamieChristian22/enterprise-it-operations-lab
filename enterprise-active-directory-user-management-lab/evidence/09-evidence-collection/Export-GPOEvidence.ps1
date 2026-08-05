[CmdletBinding()]
param(
    [Parameter(Mandatory)][string]$OutputPath,
    [string]$DomainController = "DC01",
    [string]$FileServer = "FS01",
    [string]$ClientComputer = "CL01"
)

Import-Module GroupPolicy -ErrorAction Stop

Get-GPO -All |
    Select-Object DisplayName,Id,GpoStatus,CreationTime,ModificationTime,Owner |
    Sort-Object DisplayName |
    Export-Csv (Join-Path $OutputPath "gpo-inventory-live.csv") -NoTypeInformation

Get-GPOReport -All -ReportType Html -Path (Join-Path $OutputPath "gpo-report-all.html")
Get-GPOReport -All -ReportType Xml -Path (Join-Path $OutputPath "gpo-report-all.xml")
