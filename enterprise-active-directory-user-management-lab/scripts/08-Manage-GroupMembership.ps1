Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
function Write-LabLog {
    param([string]$Message,[ValidateSet('INFO','WARN','ERROR','SUCCESS')][string]$Level='INFO',[string]$LogPath)
    $line = "{0:u} [{1}] {2}" -f (Get-Date),$Level,$Message
    $line | Tee-Object -FilePath $LogPath -Append
}

[CmdletBinding(SupportsShouldProcess)]
param([Parameter(Mandatory)][string]$SamAccountName,[Parameter(Mandatory)][string]$GroupName,[Parameter(Mandatory)][ValidateSet('Add','Remove')][string]$Action,[Parameter(Mandatory)][string]$TicketNumber,[Parameter(Mandatory)][string]$Approver)
Import-Module ActiveDirectory
$Root=Split-Path -Parent $PSScriptRoot;$LogDir=Join-Path $Root 'evidence\logs';New-Item -ItemType Directory $LogDir -Force|Out-Null;$LogPath=Join-Path $LogDir ("group-change-{0}.log" -f (Get-Date -Format 'yyyyMMdd-HHmmss'))
$user=Get-ADUser $SamAccountName;$group=Get-ADGroup $GroupName
if($GroupName -match 'Domain Admins|Enterprise Admins|Schema Admins'){throw 'Privileged tier-zero group changes require escalation.'}
if($PSCmdlet.ShouldProcess("$SamAccountName -> $GroupName","$Action membership")){
 if($Action -eq 'Add'){Add-ADGroupMember $group $user}else{Remove-ADGroupMember $group $user -Confirm:$false}
 Write-LabLog "$Action $SamAccountName $GroupName; ticket=$TicketNumber; approver=$Approver." SUCCESS $LogPath
}
