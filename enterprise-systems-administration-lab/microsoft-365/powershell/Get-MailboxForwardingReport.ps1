#Requires -Version 7.2
[CmdletBinding()]
param(
    [string]$OutputPath = "./reports/mailbox-forwarding-report.csv"
)

$ErrorActionPreference = "Stop"

$rows = Get-Mailbox -ResultSize Unlimited | ForEach-Object {
    $mailbox = $_
    $forwardingSmtp = $mailbox.ForwardingSmtpAddress
    $forwardingAddress = $mailbox.ForwardingAddress

    if ($forwardingSmtp -or $forwardingAddress) {
        [pscustomobject]@{
            DisplayName = $mailbox.DisplayName
            PrimarySmtpAddress = $mailbox.PrimarySmtpAddress
            ForwardingSmtpAddress = $forwardingSmtp
            ForwardingAddress = $forwardingAddress
            DeliverToMailboxAndForward = $mailbox.DeliverToMailboxAndForward
        }
    }
}

$rows | Export-Csv -Path $OutputPath -NoTypeInformation
$rows
