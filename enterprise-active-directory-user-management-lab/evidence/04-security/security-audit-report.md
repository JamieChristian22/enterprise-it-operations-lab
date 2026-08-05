# Security Audit Report

## Scope
- Privileged group membership
- Help Desk delegation
- Password and lockout policy
- AGDLP implementation
- NTFS permissions
- Audit policy
- Disabled-account handling

## Findings
| ID | Severity | Finding | Resolution |
|---|---|---|---|
| SEC-01 | Low | One stale disabled account remained in original OU | Moved to Disabled Users OU |
| SEC-02 | Low | Public share Modify group lacked owner documentation | Owner added to permissions matrix |
| SEC-03 | Informational | GPO backup retention not previously documented | 90-day retention added |

## Final Risk
No high or critical findings remained. Residual risk is LOW.
