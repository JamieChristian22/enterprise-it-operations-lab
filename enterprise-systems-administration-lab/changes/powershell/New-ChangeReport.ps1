[CmdletBinding()]
param([Parameter(Mandatory)][string]$CsvPath)
$data=Import-Csv $CsvPath
$total=$data.Count
$successful=($data | Where-Object Outcome -eq 'Successful').Count
$backedOut=($data | Where-Object Outcome -eq 'Backed Out').Count
[pscustomobject]@{
 TotalChanges=$total
 Successful=$successful
 BackedOut=$backedOut
 SuccessRatePct=if($total){[math]::Round(($successful/$total)*100,1)}else{0}
}
