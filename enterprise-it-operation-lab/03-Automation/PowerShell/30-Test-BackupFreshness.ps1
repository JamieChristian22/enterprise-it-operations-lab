[CmdletBinding()]
param([string]$BackupRoot='\\CTS-BACKUP01\Infrastructure',[int]$MaximumAgeHours=26,[string]$Path="$PSScriptRoot\..\Reports\backup-freshness.csv")
$now=Get-Date;$result=Get-ChildItem $BackupRoot -Directory -ErrorAction Stop|ForEach-Object{$latest=Get-ChildItem $_.FullName -File -Recurse|Sort-Object LastWriteTime -Descending|Select-Object -First 1;[pscustomobject]@{Workload=$_.Name;LatestBackup=$latest.FullName;LastWriteTime=$latest.LastWriteTime;AgeHours=[math]::Round(($now-$latest.LastWriteTime).TotalHours,1);Healthy=(($now-$latest.LastWriteTime).TotalHours-le $MaximumAgeHours)}}
New-Item (Split-Path $Path) -ItemType Directory -Force|Out-Null;$result|Export-Csv $Path -NoTypeInformation;$result
