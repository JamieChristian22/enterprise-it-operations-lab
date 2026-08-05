# CHG-2026-021 — Emergency VPN DNS Configuration Correction

## Record Summary

| Field | Value |
|---|---|
| Change Type | Emergency |
| Status | Closed — Successful |
| Change Owner | Jamie Christian II |
| Emergency Authority | Infrastructure Services Manager |
| Related Incident | INC-2026-104 Remote Users Unable to Resolve Internal Hosts |
| Start | 2026-07-22 09:14 ET |
| End | 2026-07-22 09:41 ET |

## Situation

Remote users could establish VPN tunnels but could not resolve internal hostnames. The incident affected 18 simulated remote users and prevented access to the internal file share and support portal.

## Emergency Justification

Waiting for the next standard CAB window would have prolonged a business-hours service outage. The proposed change restored the previously approved internal DNS server assignment on the VPN profile.

## Technical Findings

- VPN authentication succeeded.
- IP connectivity to the internal DNS server succeeded.
- `nslookup` used a public DNS resolver instead of the internal resolver.
- The VPN profile contained an incorrect DNS server value introduced during a test configuration.

## Risk Assessment

| Factor | Score |
|---|---:|
| Likelihood | 2 |
| User impact | 4 |
| Criticality | 4 |
| Rollback complexity | 1 |
| Security exposure | 3 |

**Total:** 14 — High

## Implementation Steps

1. Recorded the active VPN profile configuration.
2. Exported the current profile.
3. Replaced the incorrect DNS server value with `10.20.0.10`.
4. Restarted the VPN service.
5. Reconnected a test endpoint.
6. Cleared the local DNS cache.
7. Verified internal name resolution and file-share access.
8. Asked two representative users to reconnect and validate service.
9. Updated the incident record and service status notice.

## Validation Results

| Test | Result |
|---|---|
| VPN authentication | Passed |
| Internal DNS server assigned | Passed |
| `nslookup fileserver.corp.example` | Passed |
| Internal file share access | Passed |
| Support portal access | Passed |
| Two user confirmations | Passed |
| Monitoring alerts cleared | Passed |

## Rollback Plan

Restore the exported VPN profile, restart the VPN service, and direct users to the temporary IP-address workaround while the incident remains active.

## Emergency Approval

Approval was provided verbally at 09:12 ET by the Infrastructure Services Manager and documented in the change and incident records.

## Retrospective Review

The emergency change was reviewed on 2026-07-23.

### Root Cause

A test VPN profile was promoted without a peer review of the DNS value.

### Corrective Actions

- Require peer review for VPN profile changes.
- Add DNS resolution to the pre-deployment validation checklist.
- Restrict test-profile promotion rights.
- Add a configuration comparison step to the standard VPN change template.

## Outcome

Service was restored within 27 minutes of change authorization. No rollback was required.
