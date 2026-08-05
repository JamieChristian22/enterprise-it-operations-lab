# Delegated Help Desk Administration

## Objective
Grant Tier 1 technicians the minimum rights required to reset passwords, unlock users, and update selected attributes without Domain Admin membership.

## Delegated Scope
The group `GG_HelpDesk_Tier1` receives delegated control on department user OUs only. It may reset passwords, require password change at next sign-in, read lockout status, unlock accounts, and update telephone/office fields. It cannot create privileged groups, edit GPOs, join servers to the domain, change protected accounts, or delete OUs.

## Implementation
1. Create `GG_HelpDesk_Tier1` in `OU=Administrative Groups,OU=Groups,OU=Northstar,DC=corp,DC=northstar,DC=local`.
2. Add named technicians only after manager approval.
3. In ADUC, run **Delegate Control** on each department Users OU.
4. Select password reset and force-change rights, then add a custom task for reading/writing `lockoutTime`, `telephoneNumber`, and `physicalDeliveryOfficeName`.
5. Test with a nonprivileged technician account.
6. Record the delegation in the change log and review membership quarterly.

## Validation
A Tier 1 test account must successfully reset and unlock a standard user. The same account must fail when attempting to add itself to Domain Admins, modify a GPO, or reset a protected administrator account.

## Rollback
Remove the delegated ACEs from the affected OUs, remove technician membership from `GG_HelpDesk_Tier1`, force replication, and rerun the validation tests.
