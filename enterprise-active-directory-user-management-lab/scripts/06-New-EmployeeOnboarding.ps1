Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
function Write-LabLog {
    param([string]$Message,[ValidateSet('INFO','WARN','ERROR','SUCCESS')][string]$Level='INFO',[string]$LogPath)
    $line = "{0:u} [{1}] {2}" -f (Get-Date),$Level,$Message
    $line | Tee-Object -FilePath $LogPath -Append
}

[CmdletBinding(SupportsShouldProcess)]
param(
 [Parameter(Mandatory)][string]$FirstName,[Parameter(Mandatory)][string]$LastName,
 [Parameter(Mandatory)][ValidateSet('Information Technology','Human Resources','Finance','Operations','Sales')][string]$Department,
 [Parameter(Mandatory)][string]$Title,[string]$ManagerSamAccountName,[Parameter(Mandatory)][string]$TicketNumber,
 [Parameter(Mandatory)][SecureString]$TemporaryPassword,[string]$Office='Headquarters'
)
Import-Module ActiveDirectory
$Root=Split-Path -Parent $PSScriptRoot;$dn=(Get-ADDomain).DistinguishedName;$domain=(Get-ADDomain).DNSRoot
$LogDir=Join-Path $Root 'evidence\logs';New-Item -ItemType Directory $LogDir -Force|Out-Null;$LogPath=Join-Path $LogDir ("onboarding-{0}.log" -f (Get-Date -Format 'yyyyMMdd-HHmmss'))
$base=(($FirstName+'.'+$LastName).ToLower() -replace '[^a-z0-9.]','');$sam=$base;$i=1
while(Get-ADUser -Filter "SamAccountName -eq '$sam'" -ErrorAction SilentlyContinue){$i++;$sam="$base$i"}
$role=@{'Information Technology'='GG-IT-General';'Human Resources'='GG-HR-General';'Finance'='GG-FIN-General';'Operations'='GG-OPS-General';'Sales'='GG-SALES-General'}[$Department]
$params=@{Name="$FirstName $LastName";GivenName=$FirstName;Surname=$LastName;SamAccountName=$sam;UserPrincipalName="$sam@$domain";Department=$Department;Title=$Title;Office=$Office;Path="OU=$Department,OU=Users,OU=Northstar,$dn";AccountPassword=$TemporaryPassword;Enabled=$true;ChangePasswordAtLogon=$true;Description="Created under $TicketNumber"}
if($ManagerSamAccountName){$params.Manager=(Get-ADUser $ManagerSamAccountName).DistinguishedName}
if($PSCmdlet.ShouldProcess($sam,"Onboard employee for $TicketNumber")){
 New-ADUser @params;Add-ADGroupMember $role $sam
 $home="\\FS01\Users$\$sam";Set-ADUser $sam -HomeDirectory $home -HomeDrive 'U:'
 Write-LabLog "Onboarded $sam; role=$role; ticket=$TicketNumber; temporary password omitted." SUCCESS $LogPath
 [pscustomobject]@{SamAccountName=$sam;UPN="$sam@$domain";Department=$Department;RoleGroup=$role;HomeDirectory=$home;Ticket=$TicketNumber}
}
