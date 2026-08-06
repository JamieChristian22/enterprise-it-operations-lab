# Incident Report: Shared File Server Capacity Exhaustion

## Incident Record

| Field | Value |
|---|---|
| Incident ID | INC-1031 |
| Severity | SEV-2 High |
| Status | Closed |
| Start time | July 1, 2026, 10:06 ET |
| Detection time | July 1, 2026, 10:11 ET |
| Mitigation time | July 1, 2026, 10:32 ET |
| Restoration time | July 1, 2026, 10:58 ET |
| Duration | 52 minutes |
| Incident Commander | Jamie Christian, IT Operations Analyst |
| Technical Lead | Morgan Lee, Systems Administrator |
| Service Owner | Dana Price, Finance Operations Manager |
| Affected service | Windows departmental file services |
| Affected scope | 214 Finance and Operations users |
| Detection source | SMB transaction failure and service-desk escalation |
| Related change | CHG-EMG-260701-03 |
| Problem record | PRB-2026-029 |

## Executive Summary

A scheduled analytics export wrote 186 GB of temporary files to the Finance share, filling the data volume to 100%. SMB writes failed and several applications could not save reports. The team removed verified temporary exports, extended the virtual disk by 250 GB, and validated file integrity and permissions.

## Impact

- 214 users could open some files but could not reliably save changes.
- Finance month-end report generation stopped for 38 minutes.
- Nine application jobs failed and were rerun successfully.
- No production files were lost or corrupted.
- The SEV-2 restoration target was met.

## Severity Justification

A department-wide Tier-2 file service was unavailable for write operations during month-end processing, with no acceptable workaround.

## Detection

The first actionable signal was received at 10:11 ET from SMB transaction failure and service-desk escalation. The on-call analyst validated the alert against a real service transaction, determined scope, and assigned severity using the incident severity matrix.

## Timeline

| Time ET | Event / Decision | Owner | Evidence |
|---|---|---|---|
| 10:06 | Volume crossed 98%; warning alert generated | Monitoring | MON-STOR-311 |
| 10:11 | SMB synthetic write failed; incident acknowledged | Jamie Christian | SMB-PROBE-31 |
| 10:16 | SEV-2 declared after Finance impact confirmed | Incident Commander | BRIDGE-1031 |
| 10:22 | Large temporary export directory identified | Systems | FS-SCAN-1031 |
| 10:27 | Data owner confirmed exports were reproducible temporary data | Finance Owner | APPROVAL-1031 |
| 10:32 | 186 GB temporary data removed; writes resumed | Systems | CHG-EMG-260701-03 |
| 10:41 | Virtual disk extended by 250 GB | Systems | VCENTER-1031 |
| 10:49 | NTFS and application consistency checks passed | Technical Lead | VAL-1031-01 |
| 10:58 | Failed jobs rerun and incident closed | Incident Commander | CLOSE-1031 |

## Technical Investigation

- Volume was at 100% with no hardware or datastore fault.
- A scheduled job account created 186 GB under `Finance\Analytics\Temp`.
- Shadow-copy usage was normal and not the cause.
- NTFS event logs showed insufficient disk space but no corruption.
- The monitoring warning at 85% had been muted during a prior migration and never restored.
- No quota existed on the temporary-export directory.

The team used service-specific logs, monitoring, recent-change review, dependency checks, and direct transaction tests to isolate the fault and eliminate unrelated causes.

## Mitigation and Recovery

The technical lead selected the lowest-risk action that could restore service quickly. The incident commander recorded the risk, obtained the required emergency approval, and maintained a rollback path. After mitigation, the team completed infrastructure checks, end-user transactions, monitoring validation, and service-owner confirmation before closure.

## Root Cause Analysis

- **Trigger:** Analytics export job processed an unexpectedly large source dataset.
- **Direct cause:** Temporary files consumed all free space on the file-service volume.
- **Root cause:** The temporary workload lacked a quota, retention policy, and separate capacity boundary.
- **Contributing factors:** Capacity warning was muted; growth forecasting excluded temporary workloads.
- **Failed controls:** Monitoring hygiene, storage quota management, and job cleanup verification.

## Five Whys

1. The user-facing service failed because its immediate technical dependency was unavailable or degraded.
2. That dependency failed because a configuration, capacity, credential, security, or lifecycle condition was incorrect.
3. The condition reached production because the associated change or operational control did not test the failure mode.
4. Detection or failover was delayed because monitoring and safeguards measured component availability rather than the complete business transaction.
5. The process permitted the gap because ownership, measurable acceptance criteria, or dependency documentation was incomplete.

## Metrics

| Metric | Result | Target | Status |
|---|---:|---:|---|
| MTTD | Calculated in `incident-metrics.csv` | Service target | Recorded |
| MTTA | Within severity target | 10 min | Met |
| Time to mitigation | 10:32 ET | Incident-specific | Met |
| MTTR | 52 minutes | 240 min | Met |
| Communication cadence | Severity standard | Severity standard | Met |

## What Went Well

- The incident was managed through a single incident commander and authoritative timeline.
- Recent changes and service dependencies were reviewed early.
- The team selected a reversible mitigation before pursuing permanent repair.
- Recovery was validated with monitoring and real user transactions.
- Corrective actions were assigned with objective success criteria.

## What Did Not Go Well

- A preventative control did not cover the actual failure mode.
- Monitoring or validation emphasized component health over business transaction health.
- Dependency or ownership information required manual confirmation.
- The applicable runbook needed stronger rollback, escalation, or validation steps.

## Corrective and Preventive Actions

| ID | Action | Owner | Priority | Due date | Success criteria | Status |
|---|---|---|---|---|---|---|
| CA-1031-01 | Enable 80/90/95% tiered capacity alerts | Jamie Christian | High | 2026-07-01 | Test alerts received and routed | Complete |
| CA-1031-02 | Apply 100 GB quota to temporary export path | Morgan Lee | High | 2026-07-02 | Job stops safely before shared volume risk | Complete |
| CA-1031-03 | Add seven-day cleanup task with audit log | Morgan Lee | Medium | 2026-07-06 | Files older than seven days removed daily | Complete |
| CA-1031-04 | Add monthly capacity forecast review | Priya Shah | Medium | 2026-07-15 | 90-day forecast included in ops review | Complete |

## Validation and Closure

The technical lead confirmed normal component health, logs, monitoring, dependencies, and service transactions. The service owner confirmed the affected business workflow. The incident commander documented residual risk, linked the problem record, issued the final communication, and approved closure.

## Lessons Learned

Shared storage must isolate temporary workloads and enforce capacity guardrails; free space alone is not a control.

## References

`CHG-EMG-260701-03`, `PRB-2026-029`, incident bridge transcript, monitoring evidence, validation checklist, final stakeholder communication.
