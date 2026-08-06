[CmdletBinding()]
param([Parameter(Mandatory)][string]$CsvPath,[int]$ForecastDays=90)
$data = Import-Csv $CsvPath
foreach ($row in $data) {
  $capacity=[double]$row.Capacity_GB; $used=[double]$row.Used_GB; $growth=[double]$row.Daily_Growth_GB
  $forecast=$used+($growth*$ForecastDays)
  [pscustomobject]@{
    Resource="$($row.Asset)-$($row.Volume)"
    ForecastDays=$ForecastDays
    ForecastUsedGB=[math]::Round($forecast,1)
    ForecastUsedPct=[math]::Round(($forecast/$capacity)*100,1)
    DaysTo85Pct=if($growth -gt 0){[math]::Floor((($capacity*.85)-$used)/$growth)}else{$null}
  }
}
