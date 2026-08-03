[CmdletBinding(SupportsShouldProcess)] param([Parameter(Mandatory)][string]$SamAccountName)
$ErrorActionPreference='Stop'; Import-Module ActiveDirectory
$user=Get-ADUser $SamAccountName -Properties MemberOf
if($PSCmdlet.ShouldProcess($SamAccountName,'Disable and remove non-default groups')){Disable-ADAccount $user; foreach($g in $user.MemberOf){Remove-ADGroupMember $g $user -Confirm:$false}; Move-ADObject $user.DistinguishedName -TargetPath 'OU=CTS-Disabled-Objects,DC=cts-lab,DC=local'; "Disabled $SamAccountName"}
