# SYS-0029: VM network connectivity lost

## Incident Record

| Field | Value |
|---|---|
| Ticket ID | SYS-0029 |
| Status | Resolved |
| Priority | P2 |
| Impact | High |
| Urgency | Medium |
| Category | Virtualization |
| Assignment group | Virtualization and Compute |
| Assigned technician | Jamie Christian |
| Requester | Sydney Clark |
| Department | Engineering |
| Affected asset | SQL01 |
| Opened | 2026-07-07 09:13 ET |
| First response | 2026-07-07 09:22 ET |
| Resolved | 2026-07-07 10:03 ET |
| SLA target | 30-minute response / 8-hour restoration |
| SLA result | Met |
| Closure code | Solved – configuration or service restoration |
| Related knowledge article | KB-040 – Troubleshoot Virtual Networking |

## Executive Summary

VM network connectivity lost affected Engineering operations. The incident was investigated using documented, least-privilege administrative procedures. Service was restored without data loss, the underlying cause was corrected, and validation was completed with the requester or service owner.

## User or Monitoring Report

At 09:13 ET, Sydney Clark reported that the affected service was unavailable or behaving incorrectly. The issue was reproducible and had a confirmed business impact. No emergency workaround had been applied before the ticket reached Systems Administration.

## Business Impact

The issue disrupted a production workflow used by the Engineering department. Based on affected users, service criticality, and the availability of temporary alternatives, the incident was assigned **P2** with **high impact** and **medium urgency**.

## Scope and Safety Checks

- Confirmed the affected user, asset, service, and start time.
- Verified whether the issue affected one user, one host, one department, or the wider environment.
- Reviewed recent changes, maintenance activity, security alerts, and related incidents.
- Preserved relevant logs before making changes.
- Used approved administrative credentials and avoided exposing secrets or personal data.
- Confirmed that the proposed corrective action had a documented rollback path.

## Investigation Timeline

- **2026-07-07 09:13 ET:** Ticket created and impact confirmed with requester or monitoring source.
- **2026-07-07 09:22 ET:** Jamie Christian accepted ownership, assigned the ticket to Virtualization and Compute, and began diagnostics.
- **2026-07-07 09:34 ET:** Initial tests isolated the fault to the Virtualization service layer on or affecting SQL01.
- **2026-07-07 09:51 ET:** Corrective action completed under the documented standard operating procedure.
- **2026-07-07 10:03 ET:** Technical validation and requester confirmation completed; ticket resolved within SLA.

## Diagnostic Procedure

1. `Get-VMNetworkAdapter -VMName APP02`
2. `Get-VMSwitch`
3. `Test-VMNetworkAdapter -VMName APP02`

### Diagnostic Findings

- `Get-VMNetworkAdapter -VMName APP02` → Command output matched the expected post-remediation configuration.
- `Get-VMSwitch` → Command output matched the expected post-remediation configuration.
- `Test-VMNetworkAdapter -VMName APP02` → Command output matched the expected post-remediation configuration.

The collected evidence showed that **The VM network adapter was attached to the isolated lab virtual switch after a migration.**

## Root Cause

The VM network adapter was attached to the isolated lab virtual switch after a migration.

This was classified as a correctable operational configuration or dependency failure rather than a hardware-loss or data-loss event.

## Resolution

Connected the adapter to the production virtual switch, restored the documented VLAN, and validated gateway, DNS, and application access.

All changes were limited to the affected service and were performed using approved operational controls. No undocumented administrator accounts, broad firewall exceptions, or permanent security bypasses were introduced.

## Validation

- Repeated the original failure scenario successfully.
- Confirmed the affected service was available from an appropriate client or management network.
- Reviewed logs for new errors after remediation.
- Verified dependent services, authentication, name resolution, and connectivity where applicable.
- Observed the environment for at least 15 minutes with no recurrence.
- Received confirmation from **Sydney Clark** or the responsible service owner.
- Confirmed monitoring returned to a healthy state.

## Rollback and Recovery Readiness

The pre-change configuration and relevant command output were recorded in the ticket. If the correction had caused regression, the technician would have restored the prior setting, restarted only the affected service, and escalated to the platform owner. Backup or recovery procedures were not required because no data was lost.

## Customer Communication

**Initial update:** Systems Administration acknowledged the incident, confirmed the impact, and advised that diagnostics were in progress.

**Resolution update:** The root cause was corrected and service was tested successfully. The requester confirmed normal operation. The ticket may be reopened if the same symptoms return.

## Evidence Register

- `SYS-0029-01-initial-alert.txt` — original user or monitoring report
- `SYS-0029-02-diagnostics.txt` — sanitized command results and event details
- `SYS-0029-03-validation.txt` — post-resolution validation record

The evidence filenames describe sanitized artifacts that would be retained in the ITSM system. No production credentials, access tokens, private keys, or unredacted personal information are included in this portfolio.

## Preventive Action

- Updated the relevant operational checklist or monitoring rule.
- Confirmed configuration ownership and review frequency.
- Linked the incident to **KB-040 – Troubleshoot Virtual Networking**.
- Added a trend tag for future problem-management review.
- Recommended automation or policy enforcement where repeated manual drift was possible.

## Final Work Note

Resolved SYS-0029 after isolating the failure to the Virtualization service layer. Corrected the root cause, validated the original workflow, reviewed post-change logs, and obtained requester or service-owner confirmation. SLA met; no data loss or unresolved security exception.

## Skills Demonstrated

Virtualization, incident triage, ITSM documentation, command-line diagnostics, root-cause analysis, change safety, technical validation, customer communication, and knowledge management.
