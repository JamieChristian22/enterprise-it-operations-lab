# CHG-001 — Deploy Two-Tier PKI

**Risk:** High  
**Scope:** Root CA, Issuing CA, AIA, CDP, templates, auto-enrollment

## Implementation
Build offline Root CA, sign Issuing CA request, publish trust chain, configure revocation, and validate issuance.

## Backout
Restore server snapshots in the lab and remove published test certificates and GPO settings.

## Result
Successful.
