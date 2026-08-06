# Microsoft 365 Administration Guide

## Daily Administrative Review

- Review Microsoft 365 service health.
- Review risky users and risky sign-ins.
- Review failed sign-ins and Conditional Access failures.
- Review unresolved support incidents.
- Review license capacity.
- Review message center items requiring action.
- Review failed PowerShell automation jobs.
- Review recent administrator audit activity.

## Core PowerShell Connections

```powershell
Connect-MgGraph -Scopes @(
    "User.ReadWrite.All",
    "Group.ReadWrite.All",
    "Directory.Read.All",
    "AuditLog.Read.All",
    "Organization.Read.All"
)

Connect-ExchangeOnline
```

## User Checks

```powershell
Get-MgUser -UserId "alex.morgan@northstarservices.com"
Get-MgUserLicenseDetail -UserId "alex.morgan@northstarservices.com"
Get-MgUserMemberOf -UserId "alex.morgan@northstarservices.com"
Get-EXOMailbox -Identity "alex.morgan@northstarservices.com"
```

## Group Checks

```powershell
Get-MgGroup -Filter "displayName eq 'Finance Users'"
Get-DistributionGroup -Identity "Finance Announcements"
Get-UnifiedGroup -Identity "Finance Operations"
```

## Exchange Online Checks

```powershell
Get-EXOMailbox -ResultSize Unlimited
Get-MailboxPermission -Identity "support@northstarservices.com"
Get-RecipientPermission -Identity "support@northstarservices.com"
Get-MessageTrace -SenderAddress "alex.morgan@northstarservices.com"
```

## Security Checks

```powershell
Get-MgAuditLogSignIn -Top 25
Get-MgDirectoryRole
Get-MgIdentityConditionalAccessPolicy
```
