#Requires -Version 7.2
[CmdletBinding()]
param(
    [string]$OutputPath = "./reports/m365-license-report.csv"
)

$ErrorActionPreference = "Stop"

$report = Get-MgSubscribedSku -All | ForEach-Object {
    $enabled = $_.PrepaidUnits.Enabled
    $consumed = $_.ConsumedUnits
    [pscustomobject]@{
        SkuPartNumber = $_.SkuPartNumber
        EnabledUnits = $enabled
        ConsumedUnits = $consumed
        AvailableUnits = $enabled - $consumed
        UtilizationPercent = if ($enabled -gt 0) {
            [math]::Round(($consumed / $enabled) * 100, 2)
        } else { 0 }
    }
}

$report |
    Sort-Object SkuPartNumber |
    Export-Csv -Path $OutputPath -NoTypeInformation

$report
