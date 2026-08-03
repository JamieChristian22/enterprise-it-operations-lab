[CmdletBinding(SupportsShouldProcess)] param([Parameter(Mandatory)][string]$FirstName,[Parameter(Mandatory)][string]$LastName,[Parameter(Mandatory)][string]$Department,[Parameter(Mandatory)][securestring]$TemporaryPassword)
$ErrorActionPreference='Stop'; Import-Module ActiveDirectory
$sam=(($FirstName.Substring(0,1)+$LastName).ToLower() -replace '[^a-z0-9]','')
$ou="OU=$($Department -replace ' ','-'),OU=CTS-Users,DC=cts-lab,DC=local"
if(Get-ADUser -Filter "SamAccountName -eq '$sam'" -ErrorAction SilentlyContinue){throw "Account $sam already exists"}
if($PSCmdlet.ShouldProcess($sam,'Create domain user')){New-ADUser -Name "$FirstName $LastName" -GivenName $FirstName -Surname $LastName -SamAccountName $sam -UserPrincipalName "$sam@cts-lab.local" -Department $Department -Path $ou -AccountPassword $TemporaryPassword -Enabled $true -ChangePasswordAtLogon $true; "Created $sam"}
