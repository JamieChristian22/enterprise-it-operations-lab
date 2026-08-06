# Exchange Online Administration

## Core Responsibilities

- User mailbox management
- Shared mailbox administration
- Distribution groups
- Mailbox permissions
- Mail flow troubleshooting
- Message trace
- Automatic replies
- Mailbox recovery
- Anti-spam and anti-phishing review
- Transport rules
- Retention coordination

## Shared Mailbox Procedure

```powershell
New-Mailbox -Shared `
    -Name "Customer Support" `
    -DisplayName "Customer Support" `
    -PrimarySmtpAddress "support@northstarservices.com"

Add-MailboxPermission `
    -Identity "support@northstarservices.com" `
    -User "alex.morgan@northstarservices.com" `
    -AccessRights FullAccess `
    -InheritanceType All

Add-RecipientPermission `
    -Identity "support@northstarservices.com" `
    -Trustee "alex.morgan@northstarservices.com" `
    -AccessRights SendAs `
    -Confirm:$false
```

## Mail Flow Troubleshooting

1. Confirm sender, recipient, timestamp, and subject.
2. Check mailbox status and recipient address.
3. Run message trace.
4. Review quarantine.
5. Review transport rules and connectors.
6. Review forwarding and inbox rules.
7. Validate accepted domains and DNS when external delivery fails.
8. Document the final delivery status.
