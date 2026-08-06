[CmdletBinding()]
param([Parameter(Mandatory)][string]$CsvPath)
$data=Import-Csv $CsvPath
$data | Group-Object Server | ForEach-Object {
  $avg=($_.Group.DurationMinutes | Measure-Object -Average).Average
  [pscustomobject]@{Server=$_.Name;AverageDurationMinutes=[math]::Round($avg,1);Cycles=$_.Count}
}
