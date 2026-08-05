# User Onboarding Runbook

## Required Inputs
Approved ticket, legal name, employee ID, department, title, manager, start date, access profile.

## Procedure
1. Confirm approval and identity data.
2. Check for duplicate account.
3. Generate compliant username.
4. Create user in department OU.
5. Populate department, title, manager, office, employee ID.
6. Add department Global group.
7. Assign approved access through role mapping.
8. Create home directory.
9. Set temporary password and require change at first sign-in.
10. Validate account and group memberships.
11. Update ticket with evidence.

## Rollback
Disable the account, remove newly assigned memberships, archive the home directory, and document the reason.

## Validation
`Get-ADUser`, `Get-ADPrincipalGroupMembership`, folder ACL review, and test sign-in.
