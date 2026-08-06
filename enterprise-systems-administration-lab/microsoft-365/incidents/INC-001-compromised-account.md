# INC-001 — Suspicious Sign-In and Mailbox Rule

**Severity:** High  
**User:** `alex.morgan@northstarservices.com`

## Detection
A sign-in from an unfamiliar country was followed by creation of an inbox rule that moved financial messages to RSS Feeds.

## Investigation
The sign-in log showed successful password authentication followed by MFA approval. Audit data showed a new inbox rule and mailbox forwarding review. The user confirmed the sign-in was unauthorized.

## Containment
- Blocked sign-in
- Revoked sessions
- Reset password
- Removed unfamiliar MFA method
- Removed malicious inbox rule
- Reviewed forwarding and delegated mailbox permissions

## Validation
The user registered MFA again, successful sign-in occurred from the managed device, and no suspicious rules or forwarding remained.

## Prevention
Added user education, reviewed number-matching MFA settings, and scheduled mailbox-forwarding reports.
