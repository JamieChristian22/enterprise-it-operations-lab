#Requires -Version 5.1
[CmdletBinding()]
param(
    [Parameter(Mandatory)][string]$BackupPath
)

$ErrorActionPreference = "Stop"
New-Item -Path $BackupPath -ItemType Directory -Force | Out-Null

Backup-CARoleService -Path $BackupPath
certutil -backupdb "$BackupPath\Database"
if ($LASTEXITCODE -ne 0) { throw "CA database backup failed." }

certutil -backupkey "$BackupPath\Keys"
if ($LASTEXITCODE -ne 0) { throw "CA key backup failed." }

reg export HKLM\SYSTEM\CurrentControlSet\Services\CertSvc\Configuration "$BackupPath\ca-registry.reg" /y
Copy-Item C:\Windows\CAPolicy.inf "$BackupPath\CAPolicy.inf" -ErrorAction SilentlyContinue

Get-ChildItem $BackupPath -Recurse |
    Select-Object FullName, Length, LastWriteTime
