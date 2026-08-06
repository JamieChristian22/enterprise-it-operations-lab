[CmdletBinding()]
param([string]$NtdsPath="$env:SystemRoot\NTDS\ntds.dit",[string]$HistoryCsv=".\ad-database-history.csv")
$size=[math]::Round((Get-Item $NtdsPath -ErrorAction Stop).Length/1GB,3)
$record=[pscustomobject]@{Timestamp=Get-Date -Format s;Computer=$env:COMPUTERNAME;SizeGB=$size}
$record | Export-Csv $HistoryCsv -Append -NoTypeInformation
$record
