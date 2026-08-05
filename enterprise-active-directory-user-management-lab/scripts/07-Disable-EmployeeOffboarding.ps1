Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
function Write-LabLog {
    param([string]$Message,[ValidateSet('INFO','WARN','ERROR','SUCCESS')][string]$Level='INFO',[string]$LogPath)
    $line = "{0:u} [{1}] {2}" -f (Get-Date),$Level,$Message
    $line | Tee-Object -FilePath $LogPath -Append
}

[CmdletBinding(SupportsShouldProcess)]
param([Parameter(Mandatory)][string]$SamAccountName,[Parameter(Mandatory)][string]$TicketNumber,[Parameter(Mandatory)][datetime]$EffectiveDate,[switch]$ConfirmExecution)
Import-Module ActiveDirectory
if(-not $ConfirmExecution -and -not $WhatIfPreference){throw 'Use -WhatIf to preview or -ConfirmExecution to execute.'}
$Root=Split-Path -Parent $PSScriptRoot;$dn=(Get-ADDomain).DistinguishedName
$LogDir=Join-Path $Root 'evidence\logs';$ReportDir=Join-Path $Root 'evidence\reports';New-Item -ItemType Directory $LogDir,$ReportDir -Force|Out-Null
$LogPath=Join-Path $LogDir ("offboarding-{0}.log" -f (Get-Date -Format 'yyyyMMdd-HHmmss'))
$user=Get-ADUser $SamAccountName -Properties MemberOf,Department,Title,Manager,Enabled
$stamp=Get-Date -Format 'yyyyMMdd-HHmmss';$export=Join-Path $ReportDir "$SamAccountName-offboarding-$stamp.json"
$state=[ordered]@{Ticket=$TicketNumber;EffectiveDate=$EffectiveDate;CapturedAt=(Get-Date);SamAccountName=$user.SamAccountName;Enabled=$user.Enabled;Department=$user.Department;Title=$user.Title;Manager=$user.Manager;MemberOf=$user.MemberOf}
$state|ConvertTo-Json -Depth 4|Set-Content $export
if($PSCmdlet.ShouldProcess($SamAccountName,"Disable and offboard under $TicketNumber")){
 Disable-ADAccount $user
 $random=ConvertTo-SecureString ([Guid]::NewGuid().ToString()+'!aA9') -AsPlainText -Force
 Set-ADAccountPassword $user -Reset -NewPassword $random
 foreach($g in $user.MemberOf){Remove-ADGroupMember -Identity $g -Members $user -Confirm:$false}
 Set-ADUser $user -Description "Disabled $($EffectiveDate.ToString('yyyy-MM-dd')); ticket $TicketNumber"
 Move-ADObject $user.DistinguishedName -TargetPath "OU=Disabled Users,OU=Disabled Objects,OU=Northstar,$dn"
 Write-LabLog "Offboarded $SamAccountName; evidence=$export; ticket=$TicketNumber." SUCCESS $LogPath
}
