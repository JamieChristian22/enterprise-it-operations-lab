[CmdletBinding()] param([Parameter(Mandatory)][string]$SamAccountName)
Import-Module ActiveDirectory; $u=Get-ADUser $SamAccountName -Properties LockedOut
if(-not $u.LockedOut){"$SamAccountName is not locked"; exit 0}; Unlock-ADAccount $u; "Unlocked $SamAccountName at $(Get-Date -Format s)"
