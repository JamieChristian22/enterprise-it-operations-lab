[CmdletBinding()]param([int]$Hours=24,[string]$OutputPath='.\output\event-summary.csv')
$start=(Get-Date).AddHours(-$Hours);$rows=foreach($log in 'System','Application'){Get-WinEvent -FilterHashtable @{LogName=$log;Level=1,2,3;StartTime=$start} -ErrorAction SilentlyContinue|Select @{N='LogName';E={$log}},TimeCreated,Id,LevelDisplayName,ProviderName,Message}
New-Item (Split-Path $OutputPath) -ItemType Directory -Force|Out-Null;$rows|Export-Csv $OutputPath -NoTypeInformation;$rows
