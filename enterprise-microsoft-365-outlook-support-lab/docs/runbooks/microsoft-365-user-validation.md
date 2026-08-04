# Runbook: Microsoft 365 User Validation

## Required Checks
1. Confirm requester identity.
2. Locate the user in Microsoft 365 Admin Center.
3. Verify account is active.
4. Confirm sign-in is not blocked.
5. Confirm required license is assigned.
6. Confirm Exchange Online mailbox exists.
7. Review service health.
8. Review recent admin changes if available.
9. Document only the minimum required data.

## Expected Result for INC-10487
- User: Alex Johnson
- UPN: `alex.johnson@contoso.com`
- Account: Active
- Sign-in: Allowed
- License: Microsoft 365 E3
- Mailbox: Provisioned
- Service health: Healthy
- Admin changes: None relevant

## Escalation Conditions
- User object missing
- License assignment failure
- Mailbox provisioning error
- Sign-in blocked by policy
- Conditional Access failure
- Tenant-wide Exchange incident
- Multiple affected users
