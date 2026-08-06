# SYS-0057: Excessive failed logons on service account

## Incident Record

| Field | Value |
|---|---|
| Ticket ID | SYS-0057 |
| Status | Resolved |
| Priority | P1 |
| Impact | High |
| Urgency | High |
| Category | Security |
| Assignment group | Security Operations |
| Assigned technician | Jamie Christian |
| Requester | Avery Davis |
| Department | Finance |
| Affected asset | DC01 |
| Opened | 2026-07-13 05:59 ET |
| First response | 2026-07-13 06:04 ET |
| Resolved | 2026-07-13 06:58 ET |
| SLA target | 15-minute response / 4-hour restoration |
| SLA result | Met |
| Closure code | Solved – configuration or service restoration |
| Related knowledge article | KB-074 – Investigate Failed Authentication |

## Executive Summary

Excessive failed logons on service account affected Finance operations. The incident was investigated using documented, least-privilege administrative procedures. Service was restored without data loss, the underlying cause was corrected, and validation was completed with the requester or service owner.

## User or Monitoring Report

At 05:59 ET, Avery Davis reported that the affected service was unavailable or behaving incorrectly. The issue was reproducible and had a confirmed business impact. No emergency workaround had been applied before the ticket reached Systems Administration.

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

- **2026-07-13 05:59 ET:** Ticket created and impact confirmed with requester or monitoring source.
- **2026-07-13 06:04 ET:** Jamie Christian accepted ownership, assigned the ticket to Security Operations, and began diagnostics.
- **2026-07-13 06:16 ET:** Initial tests isolated the fault to the Security service layer on or affecting DC01.
- **2026-07-13 06:46 ET:** Corrective action completed under the documented standard operating procedure.
- **2026-07-13 06:58 ET:** Technical validation and requester confirmation completed; ticket resolved within SLA.

## Diagnostic Procedure

1. `Get-WinEvent -FilterHashtable @{LogName='Security';Id=4625} -MaxEvents 200`
2. `Get-ADUser svc_legacy -Properties LastBadPasswordAttempt,Enabled`
3. `Resolve-DnsName OLDAPP01`

### Diagnostic Findings

- `Get-WinEvent -FilterHashtable @{LogName='Security';Id=4625} -MaxEvents 200` → Relevant event sequence confirmed the root cause; no repeat error appeared after correction.
- `Get-ADUser svc_legacy -Properties LastBadPasswordAttempt,Enabled` → Command output matched the expected post-remediation configuration.
- `Resolve-DnsName OLDAPP01` → Authoritative and client lookups returned the documented production address.

The collected evidence showed that **A decommissioned server continued attempting authentication with the retired service-account password.**

## Root Cause

A decommissioned server continued attempting authentication with the retired service-account password.

This was classified as a correctable operational configuration or dependency failure rather than a hardware-loss or data-loss event.

## Resolution

Blocked the source host, disabled the obsolete scheduled task, rotated the credential, and reviewed successful logons for misuse.

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

- `SYS-0057-01-initial-alert.txt` — original user or monitoring report
- `SYS-0057-02-diagnostics.txt` — sanitized command results and event details
- `SYS-0057-03-validation.txt` — post-resolution validation record

The evidence filenames describe sanitized artifacts that would be retained in the ITSM system. No production credentials, access tokens, private keys, or unredacted personal information are included in this portfolio.

## Preventive Action

- Updated the relevant operational checklist or monitoring rule.
- Confirmed configuration ownership and review frequency.
- Linked the incident to **KB-074 – Investigate Failed Authentication**.
- Added a trend tag for future problem-management review.
- Recommended automation or policy enforcement where repeated manual drift was possible.

## Final Work Note

Resolved SYS-0057 after isolating the failure to the Security service layer. Corrected the root cause, validated the original workflow, reviewed post-change logs, and obtained requester or service-owner confirmation. SLA met; no data loss or unresolved security exception.

## Skills Demonstrated

Security, incident triage, ITSM documentation, command-line diagnostics, root-cause analysis, change safety, technical validation, customer communication, and knowledge management.
