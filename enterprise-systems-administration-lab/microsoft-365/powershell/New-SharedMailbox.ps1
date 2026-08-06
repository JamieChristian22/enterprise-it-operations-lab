#Requires -Version 7.2
[CmdletBinding(SupportsShouldProcess)]
param(
    [Parameter(Mandatory)][string]$DisplayName,
    [Parameter(Mandatory)][string]$PrimarySmtpAddress,
    [Parameter(Mandatory)][string[]]$FullAccessUsers,
    [string[]]$SendAsUsers = @()
)

$ErrorActionPreference = "Stop"

if (Get-Recipient -Identity $PrimarySmtpAddress -ErrorAction SilentlyContinue) {
    throw "A recipient already exists for $PrimarySmtpAddress."
}

if ($PSCmdlet.ShouldProcess($PrimarySmtpAddress, "Create shared mailbox")) {
    New-Mailbox -Shared `
        -Name $DisplayName `
        -DisplayName $DisplayName `
        -PrimarySmtpAddress $PrimarySmtpAddress

    foreach ($user in $FullAccessUsers) {
        Add-MailboxPermission `
            -Identity $PrimarySmtpAddress `
            -User $user `
            -AccessRights FullAccess `
            -InheritanceType All `
            -AutoMapping:$true
    }

    foreach ($user in $SendAsUsers) {
        Add-RecipientPermission `
            -Identity $PrimarySmtpAddress `
            -Trustee $user `
            -AccessRights SendAs `
            -Confirm:$false
    }

    Get-EXOMailbox -Identity $PrimarySmtpAddress
}
