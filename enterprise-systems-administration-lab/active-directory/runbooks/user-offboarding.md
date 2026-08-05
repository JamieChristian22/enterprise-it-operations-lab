# User Offboarding Runbook

1. Verify HR/manager authorization and termination effective time.
2. Disable the account and reset the password to a random unknown value.
3. Revoke active sessions/tokens where integrated services support it.
4. Remove business access groups while retaining required audit metadata.
5. Move the object to `Disabled Users` and update description with ticket/date.
6. Transfer file/mail ownership according to manager approval.
7. Remove privileged assignments immediately.
8. Export final group membership and account attributes to the ticket.
9. Retain for 30 days in the lab policy, then delete through an approved change.

**Completed example:** Jordan Lee, Sales Representative, disabled and moved on 2026-08-05 under request SR-AD-002.
