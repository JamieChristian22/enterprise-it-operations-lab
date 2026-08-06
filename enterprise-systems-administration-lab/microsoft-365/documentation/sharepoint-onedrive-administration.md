# SharePoint Online and OneDrive Administration

## SharePoint Access Model

- Site owners manage approved business membership.
- Site members can contribute.
- Site visitors receive read-only access.
- Direct user permissions are minimized.
- Access is provided through Microsoft 365 or security groups.
- External sharing is granted only when approved.

## OneDrive Recovery Workflow

1. Confirm user identity and business authorization.
2. Determine whether the file is in the recycle bin.
3. Check version history.
4. Restore the file or folder.
5. For departed users, assign temporary site collection administrator access.
6. Transfer required content to the manager or department.
7. Remove temporary administrative access.
8. Document restored items and location.

## Useful Commands

```powershell
Connect-SPOService -Url "https://northstarservices-admin.sharepoint.com"
Get-SPOSite -Limit All
Get-SPODeletedSite
Restore-SPODeletedSite -Identity $DeletedSiteUrl
```
