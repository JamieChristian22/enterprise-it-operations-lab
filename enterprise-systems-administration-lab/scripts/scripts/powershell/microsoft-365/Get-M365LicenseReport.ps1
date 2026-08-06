#Requires -Version 7.2
[CmdletBinding()]
param([string]$OutputPath=".\output\m365-license-report.csv")
$ErrorActionPreference="Stop"
$rows = Get-MgSubscribedSku -All | ForEach-Object {
    [pscustomobject]@{
        SkuPartNumber=$_.SkuPartNumber
        EnabledUnits=$_.PrepaidUnits.Enabled
        ConsumedUnits=$_.ConsumedUnits
        AvailableUnits=$_.PrepaidUnits.Enabled-$_.ConsumedUnits
        UtilizationPercent=if ($_.PrepaidUnits.Enabled) {[math]::Round(($_.ConsumedUnits/$_.PrepaidUnits.Enabled)*100,2)} else {0}
    }
}
New-Item (Split-Path $OutputPath) -ItemType Directory -Force | Out-Null
$rows | Export-Csv $OutputPath -NoTypeInformation
$rows
