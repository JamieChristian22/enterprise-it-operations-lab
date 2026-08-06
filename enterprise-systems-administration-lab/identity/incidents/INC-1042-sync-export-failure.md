# INC-1042 — Entra Connect Export Failure

**Severity:** P2  
**Status:** Resolved  
**Affected service:** Hybrid identity synchronization

## Summary
The active connector generated repeated export permission errors for 18 user updates after the synchronization service credential had expired.

## Timeline
- 08:12 — Health alert received.
- 08:18 — Identity Operations confirmed imports succeeded but exports failed.
- 08:27 — Connector account status and event logs reviewed.
- 08:36 — Expired credential identified; no privileged identities affected.
- 08:48 — Credential rotated through approved procedure.
- 08:55 — Delta synchronization completed successfully.
- 09:08 — All 18 objects validated in Microsoft Entra ID.

## Root Cause
The connector credential rotation task was not linked to the service-account expiration schedule.

## Resolution
Rotated the credential, updated the connector configuration, ran one controlled delta cycle, and verified object and password hash synchronization health.

## Corrective Actions
- Added service-account expiration monitoring.
- Added owner and next-rotation date to the service-account register.
- Updated the health-check runbook.
