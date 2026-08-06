# SYS-0047: Secure print release unavailable

## Incident Record

| Field | Value |
|---|---|
| Ticket ID | SYS-0047 |
| Status | Resolved |
| Priority | P2 |
| Impact | Medium |
| Urgency | Medium |
| Category | Printing |
| Assignment group | End-User Infrastructure |
| Assigned technician | Jamie Christian |
| Requester | Avery Davis |
| Department | Marketing |
| Affected asset | MON01 |
| Opened | 2026-07-11 03:39 ET |
| First response | 2026-07-11 03:48 ET |
| Resolved | 2026-07-11 04:43 ET |
| SLA target | 30-minute response / 8-hour restoration |
| SLA result | Met |
| Closure code | Solved – configuration or service restoration |
| Related knowledge article | KB-088 – Troubleshoot Secure Printing |

## Executive Summary

Secure print release unavailable affected Marketing operations. The incident was investigated using documented, least-privilege administrative procedures. Service was restored without data loss, the underlying cause was corrected, and validation was completed with the requester or service owner.

## User or Monitoring Report

At 03:39 ET, Avery Davis reported that the affected service was unavailable or behaving incorrectly. The issue was reproducible and had a confirmed business impact. No emergency workaround had been applied before the ticket reached Systems Administration.

## Business Impact

The issue disrupted a production workflow used by the Marketing department. Based on affected users, service criticality, and the availability of temporary alternatives, the incident was assigned **P2** with **medium impact** and **medium urgency**.

## Scope and Safety Checks

- Confirmed the affected user, asset, service, and start time.
- Verified whether the issue affected one user, one host, one department, or the wider environment.
- Reviewed recent changes, maintenance activity, security alerts, and related incidents.
- Preserved relevant logs before making changes.
- Used approved administrative credentials and avoided exposing secrets or personal data.
- Confirmed that the proposed corrective action had a documented rollback path.

## Investigation Timeline

- **2026-07-11 03:39 ET:** Ticket created and impact confirmed with requester or monitoring source.
- **2026-07-11 03:48 ET:** Jamie Christian accepted ownership, assigned the ticket to End-User Infrastructure, and began diagnostics.
- **2026-07-11 04:00 ET:** Initial tests isolated the fault to the Printing service layer on or affecting MON01.
- **2026-07-11 04:31 ET:** Corrective action completed under the documented standard operating procedure.
- **2026-07-11 04:43 ET:** Technical validation and requester confirmation completed; ticket resolved within SLA.

## Diagnostic Procedure

1. `Get-ChildItem Cert:\LocalMachine\My | Sort NotAfter`
2. `Test-NetConnection PRINT01 -Port 443`
3. `Get-Service PrintRelease`

### Diagnostic Findings

- `Get-ChildItem Cert:\LocalMachine\My | Sort NotAfter` → Command output matched the expected post-remediation configuration.
- `Test-NetConnection PRINT01 -Port 443` → Connectivity test returned `TcpTestSucceeded: True` after remediation.
- `Get-Service PrintRelease` → Service state reported Running/active and remained stable through the observation period.

The collected evidence showed that **The print-management server certificate expired, preventing badge-release clients from connecting.**

## Root Cause

The print-management server certificate expired, preventing badge-release clients from connecting.

This was classified as a correctable operational configuration or dependency failure rather than a hardware-loss or data-loss event.

## Resolution

Renewed the certificate, updated the service binding, restarted the release service, and completed badge-release testing.

All changes were limited to the affected service and were performed using approved operational controls. No undocumented administrator accounts, broad firewall exceptions, or permanent security bypasses were introduced.

## Validation

- Repeated the original failure scenario successfully.
- Confirmed the affected service was available from an appropriate client or management network.
- Reviewed logs for new errors after remediation.
- Verified dependent services, authentication, name resolution, and connectivity where applicable.
- Observed the environment for at least 15 minutes with no recurrence.
- Received confirmation from **Avery Davis** or the responsible service owner.
- Confirmed monitoring returned to a healthy state.

## Rollback and Recovery Readiness

The pre-change configuration and relevant command output were recorded in the ticket. If the correction had caused regression, the technician would have restored the prior setting, restarted only the affected service, and escalated to the platform owner. Backup or recovery procedures were not required because no data was lost.

## Customer Communication

**Initial update:** Systems Administration acknowledged the incident, confirmed the impact, and advised that diagnostics were in progress.

**Resolution update:** The root cause was corrected and service was tested successfully. The requester confirmed normal operation. The ticket may be reopened if the same symptoms return.

## Evidence Register

- `SYS-0047-01-initial-alert.txt` — original user or monitoring report
- `SYS-0047-02-diagnostics.txt` — sanitized command results and event details
- `SYS-0047-03-validation.txt` — post-resolution validation record

The evidence filenames describe sanitized artifacts that would be retained in the ITSM system. No production credentials, access tokens, private keys, or unredacted personal information are included in this portfolio.

## Preventive Action

- Updated the relevant operational checklist or monitoring rule.
- Confirmed configuration ownership and review frequency.
- Linked the incident to **KB-088 – Troubleshoot Secure Printing**.
- Added a trend tag for future problem-management review.
- Recommended automation or policy enforcement where repeated manual drift was possible.

## Final Work Note

Resolved SYS-0047 after isolating the failure to the Printing service layer. Corrected the root cause, validated the original workflow, reviewed post-change logs, and obtained requester or service-owner confirmation. SLA met; no data loss or unresolved security exception.

## Skills Demonstrated

Printing, incident triage, ITSM documentation, command-line diagnostics, root-cause analysis, change safety, technical validation, customer communication, and knowledge management.
