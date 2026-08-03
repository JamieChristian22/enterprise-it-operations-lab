[CmdletBinding()]
param([Parameter(Mandatory)][string]$SamAccountName,[int]$Hours=24,[string]$PdcEmulator=(Get-ADDomain).PDCEmulator)
Import-Module ActiveDirectory;$start=(Get-Date).AddHours(-$Hours)
$events=Get-WinEvent -ComputerName $PdcEmulator -FilterHashtable @{LogName='Security';Id=4740;StartTime=$start} -ErrorAction Stop|Where-Object Message -match "Account Name:\s+$([regex]::Escape($SamAccountName))\b"
[pscustomobject]@{User=$SamAccountName;PdcEmulator=$PdcEmulator;LockedOut=(Get-ADUser $SamAccountName -Properties LockedOut).LockedOut;Events=@($events|Select-Object TimeCreated,MachineName,RecordId,Message);Collected=(Get-Date)}
