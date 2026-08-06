#Requires -Version 5.1
[CmdletBinding()]
param([Parameter(Mandatory)][string]$Path,[int]$MaximumAgeHours=24,[string]$OutputPath=".\output\backup.json")
if (-not (Test-Path $Path)) { throw "Backup path not found." }
$latest = Get-ChildItem $Path -File -Recurse | Sort-Object LastWriteTime -Descending | Select-Object -First 1
$result=[pscustomobject]@{
    Path=$Path;LatestBackup=$latest.FullName;LastWriteTime=$latest.LastWriteTime
    AgeHours=if($latest){[math]::Round(((Get-Date)-$latest.LastWriteTime).TotalHours,2)}else{$null}
    Passed=if($latest){((Get-Date)-$latest.LastWriteTime).TotalHours -le $MaximumAgeHours}else{$false}
}
New-Item (Split-Path $OutputPath) -ItemType Directory -Force | Out-Null
$result | ConvertTo-Json | Set-Content $OutputPath
$result
if(-not $result.Passed){exit 1}
