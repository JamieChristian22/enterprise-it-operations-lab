Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
function Write-LabLog {
    param([string]$Message,[ValidateSet('INFO','WARN','ERROR','SUCCESS')][string]$Level='INFO',[string]$LogPath)
    $line = "{0:u} [{1}] {2}" -f (Get-Date),$Level,$Message
    $line | Tee-Object -FilePath $LogPath -Append
}

Import-Module ActiveDirectory
$Root=Split-Path -Parent $PSScriptRoot;$ReportDir=Join-Path $Root 'evidence\reports';New-Item -ItemType Directory $ReportDir -Force|Out-Null
$stamp=Get-Date -Format 'yyyyMMdd-HHmmss'
Get-ADUser -Filter * -Properties Department,Title,Manager,Enabled,LastLogonDate,PasswordLastSet,PasswordNeverExpires |
 Select-Object SamAccountName,Name,Department,Title,Enabled,LastLogonDate,PasswordLastSet,PasswordNeverExpires,Manager |
 Export-Csv (Join-Path $ReportDir "users-$stamp.csv") -NoTypeInformation
Search-ADAccount -AccountInactive -UsersOnly -TimeSpan 45.00:00:00 |
 Select-Object SamAccountName,Name,LastLogonDate,Enabled |
 Export-Csv (Join-Path $ReportDir "inactive-users-$stamp.csv") -NoTypeInformation
$priv='Domain Admins','Enterprise Admins','Administrators','ADM-HelpDesk-PasswordReset'
foreach($g in $priv){Get-ADGroupMember $g -Recursive -ErrorAction SilentlyContinue|Select-Object @{n='Group';e={$g}},Name,SamAccountName,ObjectClass|Export-Csv (Join-Path $ReportDir "privileged-$stamp.csv") -Append -NoTypeInformation}
Get-ADGroup -Filter * -Properties Description,ManagedBy,GroupScope,GroupCategory |
 Select-Object Name,GroupScope,GroupCategory,Description,ManagedBy |
 Export-Csv (Join-Path $ReportDir "groups-$stamp.csv") -NoTypeInformation
Write-Output "Audit reports written to $ReportDir"
