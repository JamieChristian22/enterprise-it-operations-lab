[CmdletBinding(SupportsShouldProcess)]
param([string]$BackupRoot='C:\CTS-Automation\Backups\GPO',[int]$RetentionDays=90)
$ErrorActionPreference='Stop'; Import-Module GroupPolicy
$stamp=Get-Date -Format 'yyyyMMdd-HHmmss'; $destination=Join-Path $BackupRoot $stamp
if($PSCmdlet.ShouldProcess($destination,'Back up all Group Policy Objects')){New-Item $destination -ItemType Directory -Force|Out-Null; Backup-GPO -All -Path $destination -Comment "CTS scheduled backup $stamp"|Out-Null}
Get-ChildItem $BackupRoot -Directory -ErrorAction SilentlyContinue|Where-Object LastWriteTime -lt (Get-Date).AddDays(-$RetentionDays)|ForEach-Object{if($PSCmdlet.ShouldProcess($_.FullName,'Remove expired GPO backup')){Remove-Item $_.FullName -Recurse -Force}}
[pscustomobject]@{BackupPath=$destination;Completed=(Get-Date);RetentionDays=$RetentionDays}
