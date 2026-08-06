# INC-1071 — Unapproved Privileged Group Membership

**Severity:** P1 Security  
**Status:** Resolved

## Summary
Monitoring detected an account added to `Tier0-Admins` without a matching approved change record.

## Response
The account was removed within nine minutes, the initiating administrator session was disabled, relevant Security event logs were preserved, and Security Operations opened an investigation.

## Finding
An administrator selected the wrong similarly named group during an urgent server-support request. No Tier 0 logon occurred.

## Corrective Actions
- Renamed administrative groups with explicit tier prefixes.
- Added just-in-time approval for Tier 0 elevation.
- Added a warning banner to the access request form.
- Required peer validation for emergency Tier 0 changes.
