Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
function Write-LabLog {
    param([string]$Message,[ValidateSet('INFO','WARN','ERROR','SUCCESS')][string]$Level='INFO',[string]$LogPath)
    $line = "{0:u} [{1}] {2}" -f (Get-Date),$Level,$Message
    $line | Tee-Object -FilePath $LogPath -Append
}

[CmdletBinding(SupportsShouldProcess)]
param([Parameter(Mandatory)][SecureString]$TemporaryPassword)
Import-Module ActiveDirectory
$Root=Split-Path -Parent $PSScriptRoot;$dn=(Get-ADDomain).DistinguishedName
$LogDir=Join-Path $Root 'evidence\logs';New-Item -ItemType Directory $LogDir -Force|Out-Null
$LogPath=Join-Path $LogDir ("bulk-users-{0}.log" -f (Get-Date -Format 'yyyyMMdd-HHmmss'))
$domain=(Get-ADDomain).DNSRoot
foreach($u in Import-Csv (Join-Path $Root 'config\users.csv')){
 try{
  if(Get-ADUser -Filter "SamAccountName -eq '$($u.SamAccountName)'" -ErrorAction SilentlyContinue){Write-LabLog "User exists: $($u.SamAccountName)" WARN $LogPath;continue}
  $path="OU=$($u.Department),OU=Users,OU=Northstar,$dn"
  $params=@{Name="$($u.FirstName) $($u.LastName)";GivenName=$u.FirstName;Surname=$u.LastName;SamAccountName=$u.SamAccountName;UserPrincipalName="$($u.SamAccountName)@$domain";Department=$u.Department;Title=$u.Title;Office=$u.Office;Path=$path;AccountPassword=$TemporaryPassword;Enabled=([bool]::Parse($u.Enabled));ChangePasswordAtLogon=$true}
  if($u.ManagerSamAccountName){$params.Manager=(Get-ADUser $u.ManagerSamAccountName).DistinguishedName}
  if($PSCmdlet.ShouldProcess($u.SamAccountName,'Create AD user')){New-ADUser @params;Add-ADGroupMember -Identity $u.RoleGroup -Members $u.SamAccountName;Write-LabLog "Created $($u.SamAccountName) and added to $($u.RoleGroup)." SUCCESS $LogPath}
 }catch{Write-LabLog "Failed $($u.SamAccountName): $($_.Exception.Message)" ERROR $LogPath}
}
