#Requires -Version 5.1
[CmdletBinding()]
param(
    [Parameter(Mandatory)][string]$CsvPath,
    [Parameter(Mandatory)][string]$Title,
    [string]$OutputPath = ".\output\report.html"
)

$data = Import-Csv $CsvPath
$style = @"
<style>
body { font-family: Arial, sans-serif; margin: 32px; }
table { border-collapse: collapse; width: 100%; }
th, td { border: 1px solid #cccccc; padding: 8px; text-align: left; }
th { background: #eeeeee; }
</style>
"@

$html = $data |
    ConvertTo-Html -Title $Title -Head $style -PreContent "<h1>$Title</h1><p>Generated: $(Get-Date -Format o)</p>"

New-Item (Split-Path $OutputPath) -ItemType Directory -Force | Out-Null
$html | Set-Content $OutputPath
Write-Host "Created $OutputPath"
