#Requires -Version 5.1
[CmdletBinding()]
param(
    [string[]]$ComputerName = @($env:COMPUTERNAME),
    [string]$OutputPath = ".\output\patch-compliance.csv"
)

$rows = foreach ($computer in $ComputerName) {
    Invoke-Command -ComputerName $computer -ScriptBlock {
        $latest = Get-HotFix |
            Sort-Object InstalledOn -Descending |
            Select-Object -First 1
        [pscustomobject]@{
            Asset = $env:COMPUTERNAME
            LatestHotFix = $latest.HotFixID
            InstalledOn = $latest.InstalledOn
            Status = if ($latest) { "Reported" } else { "NoData" }
        }
    }
}

New-Item (Split-Path $OutputPath) -ItemType Directory -Force | Out-Null
$rows | Export-Csv $OutputPath -NoTypeInformation
$rows
