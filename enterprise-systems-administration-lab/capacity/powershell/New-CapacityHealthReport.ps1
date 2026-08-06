[CmdletBinding()]
param([Parameter(Mandatory)][string]$InputCsv,[string]$OutputHtml="capacity-health-report.html")
$data=Import-Csv $InputCsv
$style='<style>body{font-family:Arial;margin:30px}table{border-collapse:collapse}td,th{border:1px solid #bbb;padding:6px}th{background:#eee}</style>'
$data | ConvertTo-Html -Title 'Capacity Health Report' -Head $style -PreContent "<h1>Capacity Health Report</h1><p>Generated $(Get-Date)</p>" | Set-Content $OutputHtml
Get-Item $OutputHtml
