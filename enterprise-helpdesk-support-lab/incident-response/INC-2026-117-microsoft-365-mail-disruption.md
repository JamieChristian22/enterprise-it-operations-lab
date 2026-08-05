# INC-2026-117 — Microsoft 365 Mail Disruption

## Incident Control

| Field | Value |
|---|---|
| Priority | P2 |
| Status | Closed |
| Incident Commander | Jamie Christian II |
| Technical Lead | Microsoft 365 Administrator |
| Service Owner | Collaboration Services Manager |
| Start Time | 2026-07-27 10:18 ET |
| Detection Time | 2026-07-27 10:24 ET |
| Restoration Time | 2026-07-27 11:36 ET |
| Related Problem | PRB-2026-011 |

## Executive Summary

Users in the Finance and Operations departments experienced delayed outbound mail and Outlook send/receive errors. Web access remained available. The issue was isolated to an outdated Outlook authentication token and profile cache condition following a policy update.

## Business Impact

- 26 users affected
- Outlook desktop client impacted
- Outlook on the web available as workaround
- No mail loss confirmed
- Delayed business communication

## Timeline

| Time | Event | Owner | Result |
|---|---|---|---|
| 10:18 | First failures begin | Users | Mail delay |
| 10:24 | Service Desk detects pattern | Jamie Christian II | P2 declared |
| 10:31 | OWA confirmed healthy | Service Desk | Workaround available |
| 10:43 | Token/cache issue suspected | M365 Admin | Test profile succeeds |
| 10:55 | Repair instructions issued | Service Desk | Recovery begins |
| 11:20 | 22 users restored | Service Desk | Majority recovered |
| 11:36 | All affected users restored | Incident Commander | Resolved |

## Technical Investigation

- Exchange Online service health normal
- Outlook on the web worked
- Desktop clients showed repeated authentication prompts
- New Outlook profile succeeded
- Clearing cached credentials and refreshing tokens restored service

## Workaround

Users were directed to Outlook on the web while desktop clients were repaired.

## Recovery

1. Closed Outlook
2. Removed stale cached credentials
3. Refreshed Microsoft 365 authentication
4. Reopened Outlook
5. Recreated profiles only where required
6. Validated send/receive

## Root Cause

A subset of endpoints retained stale authentication tokens after an identity policy update.

## Corrective Actions

| Action | Owner | Due Date | Status |
|---|---|---|---|
| Publish token refresh KB | M365 Administrator | 2026-07-29 | Completed |
| Add pre-change pilot group | Change Manager | 2026-08-01 | Completed |
| Add Outlook token health check to runbook | Service Desk Lead | 2026-07-30 | Completed |

## Outcome

All users were restored within 78 minutes. No mail loss occurred.
