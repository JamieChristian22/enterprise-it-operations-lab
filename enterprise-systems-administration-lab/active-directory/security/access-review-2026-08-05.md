# Access Review — 2026-08-05

## Scope
Reviewed privileged groups, departmental role groups, resource groups, disabled accounts, and service identities.

## Results
- Domain Admins: built-in Administrator plus one named lab administrator; expected.
- Enterprise Admins: built-in Administrator only; expected for lab.
- Schema Admins: no standing named user membership.
- Disabled users in active access groups: 0.
- Direct user ACL assignments found: 0.
- Orphaned service accounts: 0.
- Accounts with `PasswordNeverExpires` outside approved service register: 0.

**Outcome:** Pass. Next review: 2026-11-05.
