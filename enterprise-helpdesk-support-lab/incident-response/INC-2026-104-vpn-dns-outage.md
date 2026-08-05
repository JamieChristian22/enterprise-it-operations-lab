# INC-2026-104 — Remote VPN DNS Outage

## 1. Incident Control

| Field | Value |
|---|---|
| Priority | P1 |
| Status | Closed |
| Incident Commander | Jamie Christian II |
| Technical Lead | Network Administrator |
| Service Owner | Infrastructure Services Manager |
| Start Time | 2026-07-22 08:57 ET |
| Detection Time | 2026-07-22 09:01 ET |
| Declaration Time | 2026-07-22 09:07 ET |
| Restoration Time | 2026-07-22 09:41 ET |
| Closure Time | 2026-07-23 14:00 ET |
| Related Change | CHG-2026-021 |

## 2. Executive Summary

Remote users could establish VPN sessions but could not resolve internal hostnames. Eighteen simulated users were unable to reach the internal file share and support portal. Service was restored by correcting the DNS server assigned by the VPN profile.

## 3. Business Impact

- 18 remote users affected
- Internal file share unavailable by hostname
- Support portal unavailable by hostname
- VPN authentication remained functional
- Temporary IP-address workaround available

## 4. Detection

The Service Desk received five related tickets within four minutes. Analysts confirmed that VPN authentication succeeded but internal DNS queries failed.

## 5. Timeline

| Time | Event | Owner | Result |
|---|---|---|---|
| 08:57 | First user impact begins | Users | Internal names fail |
| 09:01 | First ticket received | Service Desk | Incident opened |
| 09:05 | Pattern identified across users | Jamie Christian II | P1 candidate |
| 09:07 | Major incident declared | Incident Commander | Bridge opened |
| 09:12 | DNS misconfiguration identified | Network Administrator | Root cause isolated |
| 09:14 | Emergency change approved | Infrastructure Manager | CHG-2026-021 |
| 09:25 | VPN DNS setting corrected | Network Administrator | Test succeeded |
| 09:31 | Two users validate access | Service Desk | Passed |
| 09:41 | Incident resolved | Incident Commander | Service restored |

## 6. Technical Investigation

- VPN tunnels established successfully
- `ping 10.20.0.10` succeeded
- `nslookup fileserver.corp.example` used a public resolver
- VPN profile assigned the wrong DNS server
- Public DNS could not resolve internal hostnames

## 7. Containment and Workaround

Users were provided temporary IP-address access to the file share while the permanent correction was prepared.

## 8. Recovery Actions

1. Exported current VPN profile
2. Corrected DNS server to `10.20.0.10`
3. Restarted VPN service
4. Reconnected test endpoint
5. Flushed DNS cache
6. Validated internal name resolution
7. Confirmed user access

## 9. Validation

| Test | Result |
|---|---|
| VPN authentication | Passed |
| Internal DNS assignment | Passed |
| Internal hostname resolution | Passed |
| File share access | Passed |
| Support portal access | Passed |
| Monitoring health | Passed |

## 10. Root Cause

A test VPN profile containing an incorrect DNS value was promoted without peer review.

## 11. Contributing Factors

- Missing peer review
- Incomplete validation checklist
- No automated configuration comparison

## 12. Corrective Actions

| Action | Owner | Due Date | Status |
|---|---|---|---|
| Add DNS validation to VPN checklist | Network Administrator | 2026-07-29 | Completed |
| Require peer review for profile promotion | Change Manager | 2026-07-30 | Completed |
| Restrict production profile permissions | Infrastructure Manager | 2026-07-31 | Completed |

## 13. Lessons Learned

Early pattern recognition by the Service Desk reduced time to declaration. The largest gap was configuration promotion without peer review.

## 14. Closure

Service Owner confirmed restoration on 2026-07-22. Incident closed after corrective actions were accepted.
