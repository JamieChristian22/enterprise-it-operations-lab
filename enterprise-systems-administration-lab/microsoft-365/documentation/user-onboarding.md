# User Onboarding Procedure

## Required Request Data

- Legal first and last name
- Preferred display name
- Department
- Job title
- Manager
- Start date
- Employment type
- Required applications
- Required shared mailboxes
- Required Teams and SharePoint access
- License profile

## Procedure

1. Verify the approved request.
2. Check for naming conflicts.
3. Create the Entra ID account.
4. Set usage location.
5. Assign the approved license.
6. Add role-based groups.
7. Confirm mailbox provisioning.
8. Add shared mailbox and distribution group access.
9. Add Teams membership.
10. Add SharePoint access through groups.
11. Require MFA registration.
12. Validate sign-in and service access.
13. Send manager and employee completion instructions.
14. Record evidence in the ticket.

## Validation Checklist

```powershell
Get-MgUser -UserId $UserPrincipalName
Get-MgUserLicenseDetail -UserId $UserPrincipalName
Get-MgUserMemberOf -UserId $UserPrincipalName
Get-EXOMailbox -Identity $UserPrincipalName
```
