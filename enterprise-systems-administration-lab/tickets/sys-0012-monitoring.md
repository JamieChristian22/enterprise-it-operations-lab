# SYS-0012: Critical server offline alert

## Incident Record

| Field | Value |
|---|---|
| Ticket ID | SYS-0012 |
| Status | Resolved |
| Priority | P1 |
| Impact | High |
| Urgency | High |
| Category | Monitoring |
| Assignment group | Monitoring and Event Management |
| Assigned technician | Jamie Christian |
| Requester | Jordan Rivera |
| Department | Sales |
| Affected asset | WEB02 |
| Opened | 2026-07-03 20:44 ET |
| First response | 2026-07-03 20:49 ET |
| Resolved | 2026-07-03 21:36 ET |
| SLA target | 15-minute response / 4-hour restoration |
| SLA result | Met |
| Closure code | Solved – configuration or service restoration |
| Related knowledge article | KB-093 – Troubleshoot Monitoring Agents |

## Executive Summary

Critical server offline alert affected Sales operations. The incident was investigated using documented, least-privilege administrative procedures. Service was restored without data loss, the underlying cause was corrected, and validation was completed with the requester or service owner.

## User or Monitoring Report

At 20:44 ET, Jordan Rivera reported that the affected service was unavailable or behaving incorrectly. The issue was reproducible and had a confirmed business impact. No emergency workaround had been applied before the ticket reached Systems Administration.

## Business Impact

The issue disrupted a production workflow used by the Sales department. Based on affected users, service criticality, and the availability of temporary alternatives, the incident was assigned **P1** with **high impact** and **high urgency**.

## Scope and Safety Checks

- Confirmed the affected user, asset, service, and start time.
- Verified whether the issue affected one user, one host, one department, or the wider environment.
- Reviewed recent changes, maintenance activity, security alerts, and related incidents.
- Preserved relevant logs before making changes.
- Used approved administrative credentials and avoided exposing secrets or personal data.
- Confirmed that the proposed corrective action had a documented rollback path.

## Investigation Timeline

- **2026-07-03 20:44 ET:** Ticket created and impact confirmed with requester or monitoring source.
- **2026-07-03 20:49 ET:** Jamie Christian accepted ownership, assigned the ticket to Monitoring and Event Management, and began diagnostics.
- **2026-07-03 21:01 ET:** Initial tests isolated the fault to the Monitoring service layer on or affecting WEB02.
- **2026-07-03 21:24 ET:** Corrective action completed under the documented standard operating procedure.
- **2026-07-03 21:36 ET:** Technical validation and requester confirmation completed; ticket resolved within SLA.

## Diagnostic Procedure

1. `Test-NetConnection APP05 -Port 443`
2. `Get-Service MonitorAgent`
3. `Get-ChildItem Cert:\LocalMachine\My | Sort NotAfter`

### Diagnostic Findings

- `Test-NetConnection APP05 -Port 443` → Connectivity test returned `TcpTestSucceeded: True` after remediation.
- `Get-Service MonitorAgent` → Service state reported Running/active and remained stable through the observation period.
- `Get-ChildItem Cert:\LocalMachine\My | Sort NotAfter` → Command output matched the expected post-remediation configuration.

The collected evidence showed that **The monitoring agent stopped after its certificate expired, while the server itself remained available.**

## Root Cause

The monitoring agent stopped after its certificate expired, while the server itself remained available.

This was classified as a correctable operational configuration or dependency failure rather than a hardware-loss or data-loss event.

## Resolution

Renewed the agent certificate, restarted the service, forced a heartbeat, and confirmed the alert cleared.

All changes were limited to the affected service and were performed using approved operational controls. No undocumented administrator accounts, broad firewall exceptions, or permanent security bypasses were introduced.

## Validation

- Repeated the original failure scenario successfully.
- Confirmed the affected service was available from an appropriate client or management network.
- Reviewed logs for new errors after remediation.
- Verified dependent services, authentication, name resolution, and connectivity where applicable.
- Observed the environment for at least 15 minutes with no recurrence.
- Received confirmation from **Jordan Rivera** or the responsible service owner.
- Confirmed monitoring returned to a healthy state.

## Rollback and Recovery Readiness

The pre-change configuration and relevant command output were recorded in the ticket. If the correction had caused regression, the technician would have restored the prior setting, restarted only the affected service, and escalated to the platform owner. Backup or recovery procedures were not required because no data was lost.

## Customer Communication

**Initial update:** Systems Administration acknowledged the incident, confirmed the impact, and advised that diagnostics were in progress.

**Resolution update:** The root cause was corrected and service was tested successfully. The requester confirmed normal operation. The ticket may be reopened if the same symptoms return.

## Evidence Register

- `SYS-0012-01-initial-alert.txt` — original user or monitoring report
- `SYS-0012-02-diagnostics.txt` — sanitized command results and event details
- `SYS-0012-03-validation.txt` — post-resolution validation record

The evidence filenames describe sanitized artifacts that would be retained in the ITSM system. No production credentials, access tokens, private keys, or unredacted personal information are included in this portfolio.

## Preventive Action

- Updated the relevant operational checklist or monitoring rule.
- Confirmed configuration ownership and review frequency.
- Linked the incident to **KB-093 – Troubleshoot Monitoring Agents**.
- Added a trend tag for future problem-management review.
- Recommended automation or policy enforcement where repeated manual drift was possible.

## Final Work Note

Resolved SYS-0012 after isolating the failure to the Monitoring service layer. Corrected the root cause, validated the original workflow, reviewed post-change logs, and obtained requester or service-owner confirmation. SLA met; no data loss or unresolved security exception.

## Skills Demonstrated

Monitoring, incident triage, ITSM documentation, command-line diagnostics, root-cause analysis, change safety, technical validation, customer communication, and knowledge management.
