# INC-2026-123 — Active Directory Authentication Failure

## Incident Control

| Field | Value |
|---|---|
| Priority | P2 |
| Status | Closed |
| Incident Commander | Jamie Christian II |
| Technical Lead | Systems Administrator |
| Service Owner | Identity Services Manager |
| Start Time | 2026-07-30 07:42 ET |
| Detection Time | 2026-07-30 07:49 ET |
| Restoration Time | 2026-07-30 09:02 ET |
| Related Problem | PRB-2026-013 |

## Executive Summary

Users in the Operations department experienced repeated account lockouts and failed sign-ins. Investigation identified an outdated stored credential on a scheduled task that repeatedly attempted authentication using a disabled service account password.

## Business Impact

- 14 users experienced login delays
- Shared workstation access degraded
- No data loss
- Manual account unlocks provided temporary relief

## Timeline

| Time | Event | Owner | Result |
|---|---|---|---|
| 07:42 | Lockouts begin | Users | Access failures |
| 07:49 | Pattern detected | Service Desk | P2 declared |
| 08:03 | Event ID 4740 reviewed | Systems Administrator | Source identified |
| 08:18 | Scheduled task isolated | Systems Administrator | Containment |
| 08:26 | Stored credential removed | Systems Administrator | Lockouts stop |
| 08:44 | User accounts unlocked | Service Desk | Access restored |
| 09:02 | Validation completed | Incident Commander | Resolved |

## Technical Investigation

- Event Viewer showed repeated Event ID 4740
- Lockout source mapped to one shared workstation
- A scheduled task contained stale credentials
- Removing the stored credential stopped repeated failures

## Containment

The scheduled task was disabled while the credential issue was investigated.

## Recovery

1. Disabled the affected task
2. Removed the outdated credential
3. Updated the service account reference
4. Re-enabled the task
5. Unlocked affected accounts
6. Verified successful sign-ins
7. Monitored lockout events for 30 minutes

## Root Cause

A scheduled task retained an outdated password for a service account after a credential rotation.

## Corrective Actions

| Action | Owner | Due Date | Status |
|---|---|---|---|
| Inventory scheduled tasks using service accounts | Systems Administrator | 2026-08-05 | Completed |
| Add service-account dependency review to password changes | Change Manager | 2026-08-03 | Completed |
| Create lockout source troubleshooting runbook | Service Desk Lead | 2026-08-02 | Completed |

## Outcome

Authentication stability was restored. No repeat lockouts occurred during the monitoring period.
