[CmdletBinding()]
param([string]$ComputerName=$env:COMPUTERNAME)
Import-Module DhcpServer -ErrorAction Stop
Get-DhcpServerv4Scope -ComputerName $ComputerName | ForEach-Object {
  $stats=Get-DhcpServerv4ScopeStatistics -ComputerName $ComputerName -ScopeId $_.ScopeId
  [pscustomobject]@{ScopeId=$_.ScopeId;Name=$_.Name;Free=$stats.Free;InUse=$stats.InUse;PercentageInUse=$stats.PercentageInUse}
}
