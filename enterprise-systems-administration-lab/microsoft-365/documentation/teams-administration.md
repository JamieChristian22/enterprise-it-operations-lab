# Microsoft Teams Administration

## Operational Standards

- Every Team must have at least two owners.
- Team names follow the department or project naming standard.
- Guests require a business sponsor.
- Private channels require documented business need.
- Inactive Teams are reviewed before archival.
- Sensitive information must use approved locations and permissions.

## Administrative Checks

```powershell
Get-Team
Get-TeamUser -GroupId $TeamId
Get-TeamChannel -GroupId $TeamId
```

## New Team Workflow

1. Confirm purpose, owner, secondary owner, sensitivity, and lifecycle.
2. Check for an existing Team or Microsoft 365 Group.
3. Create the Team.
4. Add owners before members.
5. Create only required channels.
6. Validate SharePoint site permissions.
7. Record guest-access approval.
8. Document completion.
