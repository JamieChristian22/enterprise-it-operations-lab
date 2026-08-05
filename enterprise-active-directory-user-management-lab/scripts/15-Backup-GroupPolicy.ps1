[CmdletBinding()] param([Parameter(Mandatory)][string]$BackupPath)
Set-StrictMode -Version Latest; $ErrorActionPreference='Stop'; Import-Module GroupPolicy
New-Item -ItemType Directory -Path $BackupPath -Force|Out-Null; $result=Backup-GPO -All -Path $BackupPath -Comment "Northstar scheduled portfolio backup $(Get-Date -Format s)"; $result|Select DisplayName,Id,BackupDirectory|Export-Csv (Join-Path $BackupPath 'gpo-backup-index.csv') -NoTypeInformation; $result
