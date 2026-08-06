# Runbook — Break-Glass Account Review

## Accounts
`bg-entra-01` and `bg-entra-02`

## Monthly Review
1. Confirm both accounts are cloud-only and use the tenant default domain.
2. Confirm credentials are stored in separate secured locations.
3. Verify the accounts remain excluded only from approved Conditional Access policies.
4. Confirm no mailbox or productivity license is assigned.
5. Review sign-in logs for any use.
6. Validate alerting on every sign-in attempt.
7. Perform a controlled credential verification according to policy without disrupting monitoring.
8. Rotate credentials after use or suspected exposure.
9. Record reviewer, date, findings, and remediation.

Any unexplained sign-in is treated as a high-severity security incident.
