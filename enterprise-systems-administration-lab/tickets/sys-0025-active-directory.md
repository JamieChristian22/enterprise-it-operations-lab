# SYS-0025: Domain controller replication failure

## Incident Record

| Field | Value |
|---|---|
| Ticket ID | SYS-0025 |
| Status | Resolved |
| Priority | P1 |
| Impact | High |
| Urgency | High |
| Category | Active Directory |
| Assignment group | Identity and Access Administration |
| Assigned technician | Jamie Christian |
| Requester | Casey Patel |
| Department | Finance |
| Affected asset | DC01 |
| Opened | 2026-07-06 13:35 ET |
| First response | 2026-07-06 13:40 ET |
| Resolved | 2026-07-06 14:34 ET |
| SLA target | 15-minute response / 4-hour restoration |
| SLA result | Met |
| Closure code | Solved – configuration or service restoration |
| Related knowledge article | KB-003 – Diagnose Active Directory Replication |

## Executive Summary

Domain controller replication failure affected Finance operations. The incident was investigated using documented, least-privilege administrative procedures. Service was restored without data loss, the underlying cause was corrected, and validation was completed with the requester or service owner.

## User or Monitoring Report

At 13:35 ET, Casey Patel reported that the affected service was unavailable or behaving incorrectly. The issue was reproducible and had a confirmed business impact. No emergency workaround had been applied before the ticket reached Systems Administration.

## Business Impact

The issue disrupted a production workflow used by the Finance department. Based on affected users, service criticality, and the availability of temporary alternatives, the incident was assigned **P1** with **high impact** and **high urgency**.

## Scope and Safety Checks

- Confirmed the affected user, asset, service, and start time.
- Verified whether the issue affected one user, one host, one department, or the wider environment.
- Reviewed recent changes, maintenance activity, security alerts, and related incidents.
- Preserved relevant logs before making changes.
- Used approved administrative credentials and avoided exposing secrets or personal data.
- Confirmed that the proposed corrective action had a documented rollback path.

## Investigation Timeline

- **2026-07-06 13:35 ET:** Ticket created and impact confirmed with requester or monitoring source.
- **2026-07-06 13:40 ET:** Jamie Christian accepted ownership, assigned the ticket to Identity and Access Administration, and began diagnostics.
- **2026-07-06 13:52 ET:** Initial tests isolated the fault to the Active Directory service layer on or affecting DC01.
- **2026-07-06 14:22 ET:** Corrective action completed under the documented standard operating procedure.
- **2026-07-06 14:34 ET:** Technical validation and requester confirmation completed; ticket resolved within SLA.

## Diagnostic Procedure

1. `repadmin /replsummary`
2. `repadmin /showrepl DC02`
3. `dcdiag /test:dns /v`
4. `Resolve-DnsName _ldap._tcp.dc._msdcs.corp.example.com`

### Diagnostic Findings

- `repadmin /replsummary` → Replication failures reduced from 3 to 0; largest delta 00:02:11.
- `repadmin /showrepl DC02` → Replication failures reduced from 3 to 0; largest delta 00:02:11.
- `dcdiag /test:dns /v` → Command output matched the expected post-remediation configuration.
- `Resolve-DnsName _ldap._tcp.dc._msdcs.corp.example.com` → Authoritative and client lookups returned the documented production address.

The collected evidence showed that **DC02 could not resolve the forest root SRV records after its preferred DNS server was changed to an external resolver.**

## Root Cause

DC02 could not resolve the forest root SRV records after its preferred DNS server was changed to an external resolver.

This was classified as a correctable operational configuration or dependency failure rather than a hardware-loss or data-loss event.

## Resolution

Restored AD-integrated DNS settings on DC02, cleared the resolver cache, registered DNS records, and initiated replication.

All changes were limited to the affected service and were performed using approved operational controls. No undocumented administrator accounts, broad firewall exceptions, or permanent security bypasses were introduced.

## Validation

- Repeated the original failure scenario successfully.
- Confirmed the affected service was available from an appropriate client or management network.
- Reviewed logs for new errors after remediation.
- Verified dependent services, authentication, name resolution, and connectivity where applicable.
- Observed the environment for at least 15 minutes with no recurrence.
- Received confirmation from **Casey Patel** or the responsible service owner.
- Confirmed monitoring returned to a healthy state.

## Rollback and Recovery Readiness

The pre-change configuration and relevant command output were recorded in the ticket. If the correction had caused regression, the technician would have restored the prior setting, restarted only the affected service, and escalated to the platform owner. Backup or recovery procedures were not required because no data was lost.

## Customer Communication

**Initial update:** Systems Administration acknowledged the incident, confirmed the impact, and advised that diagnostics were in progress.

**Resolution update:** The root cause was corrected and service was tested successfully. The requester confirmed normal operation. The ticket may be reopened if the same symptoms return.

## Evidence Register

- `SYS-0025-01-initial-alert.txt` — original user or monitoring report
- `SYS-0025-02-diagnostics.txt` — sanitized command results and event details
- `SYS-0025-03-validation.txt` — post-resolution validation record

The evidence filenames describe sanitized artifacts that would be retained in the ITSM system. No production credentials, access tokens, private keys, or unredacted personal information are included in this portfolio.

## Preventive Action

- Updated the relevant operational checklist or monitoring rule.
- Confirmed configuration ownership and review frequency.
- Linked the incident to **KB-003 – Diagnose Active Directory Replication**.
- Added a trend tag for future problem-management review.
- Recommended automation or policy enforcement where repeated manual drift was possible.

## Final Work Note

Resolved SYS-0025 after isolating the failure to the Active Directory service layer. Corrected the root cause, validated the original workflow, reviewed post-change logs, and obtained requester or service-owner confirmation. SLA met; no data loss or unresolved security exception.

## Skills Demonstrated

Active Directory, incident triage, ITSM documentation, command-line diagnostics, root-cause analysis, change safety, technical validation, customer communication, and knowledge management.
