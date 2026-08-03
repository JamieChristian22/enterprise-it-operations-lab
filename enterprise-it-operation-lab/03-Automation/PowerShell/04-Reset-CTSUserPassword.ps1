[CmdletBinding(SupportsShouldProcess)] param([Parameter(Mandatory)][string]$SamAccountName,[Parameter(Mandatory)][securestring]$NewPassword)
Import-Module ActiveDirectory
if($PSCmdlet.ShouldProcess($SamAccountName,'Reset password')){Set-ADAccountPassword $SamAccountName -Reset -NewPassword $NewPassword; Set-ADUser $SamAccountName -ChangePasswordAtLogon $true; Unlock-ADAccount $SamAccountName -ErrorAction SilentlyContinue; "Password reset completed for $SamAccountName"}
