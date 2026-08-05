# User Onboarding Runbook

1. Confirm approved request, manager, start date, department, title, and access groups.
2. Check for naming collisions and duplicate identities.
3. Create the user in the correct departmental OU with UPN `first.last@corp.jamiechristian.lab`.
4. Set a random temporary password and require change at first sign-in.
5. Populate manager, department, title, office, and description attributes.
6. Add approved role groups only; never copy all memberships from another user without review.
7. Create home/share access through role-group nesting.
8. Validate `Enabled`, OU path, UPN, group membership, and password-change flag.
9. Record command output and approvals in the service request.
10. Send the manager a completion notice without exposing credentials.

**Completed example:** Avery Morgan, Operations Analyst, account `avery.morgan`, created 2026-08-05, added to `GG-OPS-Analysts`, validated successfully.
