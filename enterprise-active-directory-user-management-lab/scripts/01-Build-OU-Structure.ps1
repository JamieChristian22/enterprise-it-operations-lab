Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
function Write-LabLog {
    param([string]$Message,[ValidateSet('INFO','WARN','ERROR','SUCCESS')][string]$Level='INFO',[string]$LogPath)
    $line = "{0:u} [{1}] {2}" -f (Get-Date),$Level,$Message
    $line | Tee-Object -FilePath $LogPath -Append
}

[CmdletBinding(SupportsShouldProcess)] param()
Import-Module ActiveDirectory
$Root = Split-Path -Parent $PSScriptRoot
$LogDir = Join-Path $Root 'evidence\logs'; New-Item -ItemType Directory $LogDir -Force | Out-Null
$LogPath = Join-Path $LogDir ("ou-build-{0}.log" -f (Get-Date -Format 'yyyyMMdd-HHmmss'))
$dn=(Get-ADDomain).DistinguishedName
$ous=@(
@('Northstar',$dn),@('Admin',"OU=Northstar,$dn"),@('Privileged Users',"OU=Admin,OU=Northstar,$dn"),@('Service Accounts',"OU=Admin,OU=Northstar,$dn"),
@('Groups',"OU=Northstar,$dn"),@('Global Role Groups',"OU=Groups,OU=Northstar,$dn"),@('Resource Groups',"OU=Groups,OU=Northstar,$dn"),@('Policy Groups',"OU=Groups,OU=Northstar,$dn"),
@('Servers',"OU=Northstar,$dn"),@('Domain Controllers',"OU=Servers,OU=Northstar,$dn"),@('File Servers',"OU=Servers,OU=Northstar,$dn"),@('Member Servers',"OU=Servers,OU=Northstar,$dn"),
@('Workstations',"OU=Northstar,$dn"),@('Pilot',"OU=Workstations,OU=Northstar,$dn"),@('Headquarters',"OU=Workstations,OU=Northstar,$dn"),@('Regional Office',"OU=Workstations,OU=Northstar,$dn"),
@('Users',"OU=Northstar,$dn"),@('Finance',"OU=Users,OU=Northstar,$dn"),@('Human Resources',"OU=Users,OU=Northstar,$dn"),@('Information Technology',"OU=Users,OU=Northstar,$dn"),@('Operations',"OU=Users,OU=Northstar,$dn"),@('Sales',"OU=Users,OU=Northstar,$dn"),
@('Disabled Objects',"OU=Northstar,$dn"),@('Disabled Users',"OU=Disabled Objects,OU=Northstar,$dn"),@('Disabled Computers',"OU=Disabled Objects,OU=Northstar,$dn")
)
foreach($ou in $ous){
 $name=$ou[0];$path=$ou[1];$existing=Get-ADOrganizationalUnit -LDAPFilter "(ou=$name)" -SearchBase $path -SearchScope OneLevel -ErrorAction SilentlyContinue
 if($existing){Write-LabLog "OU exists: $name" INFO $LogPath;continue}
 if($PSCmdlet.ShouldProcess("OU=$name,$path",'Create OU')){New-ADOrganizationalUnit -Name $name -Path $path -ProtectedFromAccidentalDeletion $true;Write-LabLog "Created OU: $name" SUCCESS $LogPath}
}
