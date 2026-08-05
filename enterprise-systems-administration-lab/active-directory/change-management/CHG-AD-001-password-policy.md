# CHG-AD-001 — Strengthen Domain Password and Lockout Policy

**Status:** Completed  
**Implemented:** 2026-08-05  
**Owner:** Jamie Christian

## Change
Raised minimum password length from 12 to 14, set history to 24, and standardized lockout threshold/duration/reset to 10/15/15.

## Risk
Users with older passwords are not forced to change immediately; applications using stored passwords may lock accounts after future changes.

## Implementation
Backed up the GPO, modified settings in the test scope, ran policy validation, linked at domain scope, and refreshed policy.

## Validation
`Get-ADDefaultDomainPasswordPolicy` returned the approved values. Test user locked at the expected threshold and automatically cleared after the configured duration.

## Backout
Restore the exported GPO and previous documented settings, run `gpupdate`, and revalidate.
