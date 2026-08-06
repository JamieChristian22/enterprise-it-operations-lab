#Requires -Version 7.2
[CmdletBinding(SupportsShouldProcess)]
param(
    [Parameter(Mandatory)][string]$UserPrincipalName,
    [string]$ManagerUserPrincipalName,
    [switch]$ConvertMailboxToShared,
    [switch]$RemoveLicenses
)

$ErrorActionPreference = "Stop"

$user = Get-MgUser -UserId $UserPrincipalName -Property Id,DisplayName,AccountEnabled
if (-not $user) {
    throw "User not found: $UserPrincipalName"
}

if ($PSCmdlet.ShouldProcess($UserPrincipalName, "Disable and revoke access")) {
    Update-MgUser -UserId $user.Id -AccountEnabled:$false
    Revoke-MgUserSignInSession -UserId $user.Id | Out-Null

    if ($ConvertMailboxToShared) {
        Set-Mailbox -Identity $UserPrincipalName -Type Shared
    }

    if ($ManagerUserPrincipalName) {
        Add-MailboxPermission `
            -Identity $UserPrincipalName `
            -User $ManagerUserPrincipalName `
            -AccessRights FullAccess `
            -InheritanceType All `
            -AutoMapping:$true

        Add-RecipientPermission `
            -Identity $UserPrincipalName `
            -Trustee $ManagerUserPrincipalName `
            -AccessRights SendAs `
            -Confirm:$false
    }

    if ($RemoveLicenses) {
        $licenseIds = (Get-MgUserLicenseDetail -UserId $user.Id).SkuId
        if ($licenseIds) {
            Set-MgUserLicense `
                -UserId $user.Id `
                -AddLicenses @() `
                -RemoveLicenses $licenseIds
        }
    }

    [pscustomobject]@{
        User = $UserPrincipalName
        SignInBlocked = $true
        SessionsRevoked = $true
        SharedMailbox = [bool]$ConvertMailboxToShared
        LicensesRemoved = [bool]$RemoveLicenses
        Status = "Completed"
    }
}
