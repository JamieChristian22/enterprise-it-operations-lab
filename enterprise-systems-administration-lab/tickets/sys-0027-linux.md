# SYS-0027: systemd service fails after deployment

## Incident Record

| Field | Value |
|---|---|
| Ticket ID | SYS-0027 |
| Status | Resolved |
| Priority | P2 |
| Impact | High |
| Urgency | Medium |
| Category | Linux |
| Assignment group | Linux Platform Operations |
| Assigned technician | Jamie Christian |
| Requester | Avery Davis |
| Department | Human Resources |
| Affected asset | APP01 |
| Opened | 2026-07-06 23:49 ET |
| First response | 2026-07-06 23:58 ET |
| Resolved | 2026-07-07 00:53 ET |
| SLA target | 30-minute response / 8-hour restoration |
| SLA result | Met |
| Closure code | Solved – configuration or service restoration |
| Related knowledge article | KB-018 – Manage systemd Services |

## Executive Summary

systemd service fails after deployment affected Human Resources operations. The incident was investigated using documented, least-privilege administrative procedures. Service was restored without data loss, the underlying cause was corrected, and validation was completed with the requester or service owner.

## User or Monitoring Report

At 23:49 ET, Avery Davis reported that the affected service was unavailable or behaving incorrectly. The issue was reproducible and had a confirmed business impact. No emergency workaround had been applied before the ticket reached Systems Administration.

## Business Impact

The issue disrupted a production workflow used by the Human Resources department. Based on affected users, service criticality, and the availability of temporary alternatives, the incident was assigned **P2** with **high impact** and **medium urgency**.

## Scope and Safety Checks

- Confirmed the affected user, asset, service, and start time.
- Verified whether the issue affected one user, one host, one department, or the wider environment.
- Reviewed recent changes, maintenance activity, security alerts, and related incidents.
- Preserved relevant logs before making changes.
- Used approved administrative credentials and avoided exposing secrets or personal data.
- Confirmed that the proposed corrective action had a documented rollback path.

## Investigation Timeline

- **2026-07-06 23:49 ET:** Ticket created and impact confirmed with requester or monitoring source.
- **2026-07-06 23:58 ET:** Jamie Christian accepted ownership, assigned the ticket to Linux Platform Operations, and began diagnostics.
- **2026-07-07 00:10 ET:** Initial tests isolated the fault to the Linux service layer on or affecting APP01.
- **2026-07-07 00:41 ET:** Corrective action completed under the documented standard operating procedure.
- **2026-07-07 00:53 ET:** Technical validation and requester confirmation completed; ticket resolved within SLA.

## Diagnostic Procedure

1. `systemctl status inventory-api`
2. `journalctl -u inventory-api -b`
3. `systemd-analyze verify /etc/systemd/system/inventory-api.service`

### Diagnostic Findings

- `systemctl status inventory-api` → Service state reported Running/active and remained stable through the observation period.
- `journalctl -u inventory-api -b` → Relevant event sequence confirmed the root cause; no repeat error appeared after correction.
- `systemd-analyze verify /etc/systemd/system/inventory-api.service` → Command output matched the expected post-remediation configuration.

The collected evidence showed that **The unit referenced an environment file that was not included in the deployment package.**

## Root Cause

The unit referenced an environment file that was not included in the deployment package.

This was classified as a correctable operational configuration or dependency failure rather than a hardware-loss or data-loss event.

## Resolution

Restored the approved environment file from configuration management, reloaded systemd, and started the service.

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

- `SYS-0027-01-initial-alert.txt` — original user or monitoring report
- `SYS-0027-02-diagnostics.txt` — sanitized command results and event details
- `SYS-0027-03-validation.txt` — post-resolution validation record

The evidence filenames describe sanitized artifacts that would be retained in the ITSM system. No production credentials, access tokens, private keys, or unredacted personal information are included in this portfolio.

## Preventive Action

- Updated the relevant operational checklist or monitoring rule.
- Confirmed configuration ownership and review frequency.
- Linked the incident to **KB-018 – Manage systemd Services**.
- Added a trend tag for future problem-management review.
- Recommended automation or policy enforcement where repeated manual drift was possible.

## Final Work Note

Resolved SYS-0027 after isolating the failure to the Linux service layer. Corrected the root cause, validated the original workflow, reviewed post-change logs, and obtained requester or service-owner confirmation. SLA met; no data loss or unresolved security exception.

## Skills Demonstrated

Linux, incident triage, ITSM documentation, command-line diagnostics, root-cause analysis, change safety, technical validation, customer communication, and knowledge management.
