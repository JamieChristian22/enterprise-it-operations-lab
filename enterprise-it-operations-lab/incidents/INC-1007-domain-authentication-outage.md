# Incident Report: Domain Authentication and DNS Outage

## Incident Record

| Field | Value |
|---|---|
| Incident ID | INC-1007 |
| Severity | SEV-1 Critical |
| Status | Closed |
| Start time | June 7, 2026, 09:02 ET |
| Detection time | June 7, 2026, 09:02 ET |
| Mitigation time | June 7, 2026, 09:17 ET |
| Restoration time | June 7, 2026, 10:16 ET |
| Duration | 74 minutes |
| Incident Commander | Jamie Christian, IT Operations Analyst |
| Technical Lead | Morgan Lee, Systems Administrator |
| Service Owner | Priya Shah, Infrastructure Manager |
| Affected service | Active Directory authentication, DNS, mapped drives |
| Affected scope | 487 of 750 users; headquarters and VPN users |
| Detection source | MON-DNS-221 service-state and synthetic-logon alerts |
| Related change | CHG-260604-014 Windows cumulative patch |
| Problem record | PRB-2026-017 |

## Executive Summary

A failed Windows cumulative-update sequence left the DNS Server service disabled on domain controller `NS-DC01`. DHCP option 006 listed `NS-DC01` before the healthy resolver `NS-DC02`, causing many clients to wait for DNS timeouts before attempting the secondary resolver. New domain logons, mapped-drive connections, VPN authentication, and two internal web applications failed or were delayed. The team mitigated the incident by changing DHCP resolver order and forcing SD-WAN DNS forwarding to `NS-DC02`, then repaired and validated DNS on `NS-DC01`.

## Impact

- 487 users received delayed or failed domain sign-ins.
- 193 mapped-drive connection failures were logged.
- VPN authentication success fell from 99.7% to 61%.
- Existing Kerberos sessions generally remained active.
- Payroll and warehouse applications were inaccessible to new sessions for 29 minutes.
- The SEV-1 two-hour restoration target was met.

## Severity Justification

The incident affected more than half of the workforce and disrupted Tier-1 identity and name-resolution services without a reliable user workaround. This met SEV-1 criteria.

## Detection

Monitoring detected the stopped DNS service and synthetic logon failure at 09:02. The event was acknowledged at 09:05 and declared SEV-1 at 09:08. Detection was immediate; however, the pre-production patch check did not validate post-reboot service states.

## Timeline

| Time ET | Event / Decision | Owner | Evidence |
|---|---|---|---|
| 09:02 | DNS service and synthetic logon alerts triggered | Monitoring | MON-DNS-221, MON-AUTH-104 |
| 09:05 | On-call analyst confirmed `NS-DC01` did not answer UDP/TCP 53 | Jamie Christian | OPS-CMD-1007-01 |
| 09:08 | SEV-1 declared; bridge opened; nonessential identity changes frozen | Incident Commander | CHAT-INC1007 |
| 09:11 | `NS-DC02` confirmed healthy for DNS, LDAP, Kerberos, and replication | Systems | OPS-CMD-1007-02 |
| 09:14 | Risk review approved temporary resolver diversion | Incident Commander | DEC-1007-01 |
| 09:17 | DHCP order and SD-WAN DNS forwarding changed to prefer `NS-DC02` | Network | CHG-EMG-260607-01 |
| 09:24 | Synthetic logon success recovered above 95% | Monitoring | MON-AUTH-104 |
| 09:31 | DNS Server service repaired and set to Automatic on `NS-DC01` | Systems | EVT-NSDC01-7036 |
| 09:42 | DNS zones, SRV records, and forwarders validated | Systems | OPS-CMD-1007-03 |
| 10:05 | AD replication, user logon, mapped drives, VPN, and applications passed | Technical Lead | VAL-1007 |
| 10:16 | 15-minute stable period completed; incident closed | Incident Commander | CLOSE-1007 |

## Technical Investigation

The team tested network reachability, DNS queries, AD replication, time synchronization, and domain-controller health.

Key observations:

- `ping NS-DC01` succeeded, excluding a host or routing outage.
- `Test-NetConnection NS-DC01 -Port 53` failed.
- `Get-Service DNS` returned `Stopped`, with startup type changed to `Disabled`.
- `dcdiag /test:dns /v` failed only on `NS-DC01`.
- `repadmin /replsummary` showed normal AD replication.
- Event logs showed the update installer rolled back one component after reboot and did not restore the prior DNS service startup state.
- DHCP option 006 presented `NS-DC01` first to 82% of user VLAN leases.

Hardware failure, widespread replication failure, expired machine passwords, and a firewall change were eliminated.

## Mitigation and Recovery

The team selected DNS diversion because `NS-DC02` had adequate capacity and passed all health tests. DHCP and network forwarding were changed under emergency change `CHG-EMG-260607-01`. The DNS role on `NS-DC01` was repaired, service startup was set to Automatic, and all AD-integrated zones were checked before returning the server to the resolver pool.

## Root Cause Analysis

- **Trigger:** Installation and reboot for cumulative update `KB5061134`.
- **Direct cause:** DNS Server service on `NS-DC01` was disabled.
- **Root cause:** The patch workflow lacked an automated post-reboot control to validate and remediate required service states.
- **Contributing factors:** Primary DNS ordering favored one resolver; client retry behavior caused visible delays; the maintenance checklist verified server reachability but not DNS transaction success.
- **Failed controls:** Post-patch validation, resolver resilience testing, and service-state configuration enforcement.
- **Why redundancy did not prevent impact:** Clients were configured with two resolvers, but many applications waited through the first resolver timeout before querying the second.

## Five Whys

1. Authentication failed because clients could not reliably locate domain services.
2. Clients could not locate domain services because their preferred DNS resolver did not answer.
3. The resolver did not answer because its DNS service was disabled after patch rollback.
4. The disabled state remained because the patch process did not validate critical services after reboot.
5. The process lacked validation because service ownership and machine-readable health criteria had not been added to the standard change template.

## Metrics

| Metric | Result | Target | Status |
|---|---:|---:|---|
| MTTD | 0 min | Immediate monitoring | Met |
| MTTA | 3 min | 5 min | Met |
| Time to mitigation | 15 min | 30 min internal goal | Met |
| MTTR | 74 min | 120 min | Met |
| Communication compliance | 100% | 15-min cadence | Met |

## What Went Well

- Monitoring detected the failure before call volume peaked.
- The healthy domain controller had sufficient spare capacity.
- Incident command separated communications from technical work.
- Emergency change approval took less than three minutes.
- Validation covered identity, DNS, VPN, file shares, and business applications.

## What Did Not Go Well

- The patch checklist was reachability-focused rather than transaction-focused.
- Resolver ordering created a hidden dependency on `NS-DC01`.
- The service desk did not initially have a user-facing workaround.
- DNS service startup state was not enforced through configuration management.

## Corrective and Preventive Actions

| ID | Action | Owner | Priority | Due date | Success criteria | Status |
|---|---|---|---|---|---|---|
| CA-1007-01 | Add synthetic DNS, LDAP, Kerberos, and logon checks for both DCs | Jamie Christian | High | 2026-06-12 | Alert fires within 2 min of forced test failure | Complete |
| CA-1007-02 | Add post-patch critical-service validation script | Morgan Lee | High | 2026-06-19 | Script blocks closure when DNS/Netlogon/KDC are unhealthy | Complete |
| CA-1007-03 | Balance resolver order across user VLANs | Alex Romero | Medium | 2026-06-16 | No resolver receives more than 60% first-position assignments | Complete |
| CA-1007-04 | Enforce DNS service startup state with DSC | Morgan Lee | High | 2026-06-26 | Drift auto-corrected within 15 min | Complete |
| CA-1007-05 | Run quarterly resolver failover exercise | Priya Shah | Medium | 2026-07-15 | Test shows authentication recovery within 5 min | Complete |

## Validation and Closure

`dcdiag`, `repadmin`, DNS queries, synthetic logons, VPN authentication, mapped drives, and both affected applications passed. Monitoring remained normal for 15 minutes, and representatives from Payroll and Warehouse Operations confirmed successful access. Priya Shah approved closure at 10:16 ET.

## Lessons Learned

Redundancy is not resilience unless client behavior and failover timing are tested. Critical-service checks must validate user transactions, not merely host availability.

## References

`CHG-260604-014`, `CHG-EMG-260607-01`, `PRB-2026-017`, `MON-DNS-221`, `VAL-1007`, `KB-OPS-042`.
