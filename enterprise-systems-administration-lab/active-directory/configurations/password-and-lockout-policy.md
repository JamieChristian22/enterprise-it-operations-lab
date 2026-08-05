# Password and Account Lockout Policy

## Domain Policy
- Minimum length: 14 characters
- Password history: 24
- Minimum age: 1 day
- Maximum age: 90 days for password-based standard accounts
- Reversible encryption: Disabled
- Lockout threshold: 10 invalid attempts
- Lockout duration: 15 minutes
- Counter reset: 15 minutes

Privileged and service identities use stronger controls, separate ownership, and no shared credentials. Lockouts are investigated before repeated unlocks to prevent unresolved credential loops.
