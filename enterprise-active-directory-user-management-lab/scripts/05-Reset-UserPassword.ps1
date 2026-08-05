Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
function Write-LabLog {
    param([string]$Message,[ValidateSet('INFO','WARN','ERROR','SUCCESS')][string]$Level='INFO',[string]$LogPath)
    $line = "{0:u} [{1}] {2}" -f (Get-Date),$Level,$Message
    $line | Tee-Object -FilePath $LogPath -Append
}

[CmdletBinding(SupportsShouldProcess)]
param([Parameter(Mandatory)][string]$SamAccountName,[Parameter(Mandatory)][SecureString]$TemporaryPassword,[Parameter(Mandatory)][string]$TicketNumber,[switch]$Unlock)
Import-Module ActiveDirectory
$Root=Split-Path -Parent $PSScriptRoot;$LogDir=Join-Path $Root 'evidence\logs';New-Item -ItemType Directory $LogDir -Force|Out-Null
$LogPath=Join-Path $LogDir ("password-reset-{0}.log" -f (Get-Date -Format 'yyyyMMdd-HHmmss'))
$user=Get-ADUser $SamAccountName -Properties LockedOut,Enabled
if(-not $user.Enabled){throw 'Account is disabled. Escalate instead of resetting.'}
if($PSCmdlet.ShouldProcess($SamAccountName,"Reset password for ticket $TicketNumber")){
 Set-ADAccountPassword -Identity $user -Reset -NewPassword $TemporaryPassword
 Set-ADUser -Identity $user -ChangePasswordAtLogon $true
 if($Unlock -and $user.LockedOut){Unlock-ADAccount -Identity $user}
 Write-LabLog "Password reset completed for $SamAccountName under $TicketNumber. Password not logged." SUCCESS $LogPath
}
