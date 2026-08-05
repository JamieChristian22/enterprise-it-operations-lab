[CmdletBinding(SupportsShouldProcess)] param([Parameter(Mandatory)][string]$SamAccountName,[Parameter(Mandatory)][datetime]$ReviewDate,[Parameter(Mandatory)][string]$Ticket)
Set-StrictMode -Version Latest; $ErrorActionPreference='Stop'; Import-Module ActiveDirectory
$domain='DC=corp,DC=northstar,DC=local'; $u=Get-ADUser $SamAccountName -Properties DistinguishedName
if($PSCmdlet.ShouldProcess($SamAccountName,"Place on leave under $Ticket")){ Disable-ADAccount $u; Set-ADUser $u -Description "Leave of absence; review $($ReviewDate.ToString('yyyy-MM-dd')); $Ticket"; Move-ADObject $u.DistinguishedName -TargetPath "OU=Leave,OU=Lifecycle,OU=Northstar,$domain" }
