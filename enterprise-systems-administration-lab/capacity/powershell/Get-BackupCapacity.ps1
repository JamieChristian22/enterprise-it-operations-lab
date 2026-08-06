[CmdletBinding()]
param([Parameter(Mandatory)][string]$Path)
$drive=Get-PSDrive -Name ([IO.Path]::GetPathRoot((Resolve-Path $Path)).TrimEnd(':\'))
[pscustomobject]@{Path=$Path;UsedGB=[math]::Round($drive.Used/1GB,2);FreeGB=[math]::Round($drive.Free/1GB,2);UsedPct=[math]::Round(($drive.Used/($drive.Used+$drive.Free))*100,2)}
