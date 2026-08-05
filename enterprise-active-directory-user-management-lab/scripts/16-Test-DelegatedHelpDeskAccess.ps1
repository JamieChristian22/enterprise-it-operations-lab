[CmdletBinding()] param([Parameter(Mandatory)][string]$TestUser,[Parameter(Mandatory)][string]$TargetUser)
Set-StrictMode -Version Latest; $ErrorActionPreference='Stop'; Import-Module ActiveDirectory
$target=Get-ADUser $TargetUser -Properties lockoutTime; [pscustomobject]@{Technician=$TestUser;Target=$TargetUser;TargetFound=[bool]$target;ExpectedAllowed='Reset password; unlock; update office/phone';ExpectedDenied='Domain Admin membership; GPO edit; protected account administration';RunAt=(Get-Date).ToString('s')}
