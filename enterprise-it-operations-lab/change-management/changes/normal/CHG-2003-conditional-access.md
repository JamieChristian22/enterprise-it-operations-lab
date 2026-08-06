# CHG-2003 — Require MFA for Privileged Roles

**Type:** Normal  
**Risk score:** 11 — Medium  
**Owner:** Identity and Security  
**Window:** 2026-07-25 19:00–20:00 ET

## Scope

Require MFA for administrator roles and block legacy authentication.

## Prechecks

- Pilot accounts validated
- Emergency accounts reviewed
- Exclusions documented
- Sign-in logs reviewed

## Implementation

1. Enable policy in report-only mode.
2. Review impact.
3. Exclude emergency accounts.
4. Enable policy for privileged roles.
5. Validate administrator sign-ins.

## Rollback

Disable policy or return to report-only mode.

## Result

Successful.
