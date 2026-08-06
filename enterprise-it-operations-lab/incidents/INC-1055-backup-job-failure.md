# Incident Report: Virtual Machine Backup Chain Failure

## Incident Record

| Field | Value |
|---|---|
| Incident ID | INC-1055 |
| Severity | SEV-3 Medium |
| Status | Closed |
| Start time | July 15, 2026, 00:30 ET |
| Detection time | July 15, 2026, 06:30 ET |
| Mitigation time | July 15, 2026, 07:12 ET |
| Restoration time | July 15, 2026, 08:05 ET |
| Duration | 6-hour detection window; 95-minute response |
| Incident Commander | Jamie Christian, IT Operations Analyst |
| Technical Lead | Morgan Lee, Systems Administrator |
| Service Owner | Priya Shah, Infrastructure Manager |
| Affected service | Nightly virtual machine backups |
| Affected scope | 12 non-production and 3 production VMs |
| Detection source | Morning backup-summary report |
| Related change | CHG-260714-006 |
| Problem record | PRB-2026-039 |

## Executive Summary

A repository gateway service-account password rotation was not updated in the backup credential store. Fifteen backup jobs failed authentication. No restore point was lost because the previous night's backups remained valid. Credentials were updated, an active-full backup was run for three production VMs, and file-level restores were tested.

## Impact

- Fifteen scheduled backups failed.
- The recovery-point objective temporarily increased from 24 to 48 hours for affected VMs.
- No active restore request occurred during the exposure window.
- Production systems stayed available.
- The SEV-3 response target was met after detection.

## Severity Justification

Backup protection was degraded but production services remained available and valid prior restore points existed.

## Detection

The first actionable signal was received at 06:30 ET from Morning backup-summary report. The on-call analyst validated the alert against a real service transaction, determined scope, and assigned severity using the incident severity matrix.

## Timeline

| Time ET | Event / Decision | Owner | Evidence |
|---|---|---|---|
| 00:30 | First job failed repository authentication | Veeam | JOB-1055-01 |
| 02:14 | Fifteenth affected job failed | Veeam | JOB-1055-15 |
| 06:30 | Morning summary reviewed; incident created | Jamie Christian | RPT-BACKUP-0715 |
| 06:42 | Common repository credential failure identified | Systems | VBR-LOG-1055 |
| 06:51 | SEV-3 assigned; change record reviewed | Incident Commander | INC-1055 |
| 07:12 | Credential store updated and connectivity test passed | Systems | CHG-EMG-260715-02 |
| 07:19 | Production active-full jobs started | Systems | VBR-JOBS-1055 |
| 07:48 | Three production backups completed | Systems | VBR-JOBS-1055 |
| 07:57 | Two file restores and one application-item restore passed | Technical Lead | VAL-1055 |
| 08:05 | Remaining jobs scheduled; incident closed | Incident Commander | CLOSE-1055 |

## Technical Investigation

- All failed jobs shared the same repository gateway.
- Repository storage capacity and network connectivity were normal.
- Logs showed `Logon failure: unknown user name or bad password`.
- The service account password had been rotated under CHG-260714-006.
- The backup credential vault still contained the previous password.
- The job-failure email distribution list did not include the on-call alerting gateway.

The team used service-specific logs, monitoring, recent-change review, dependency checks, and direct transaction tests to isolate the fault and eliminate unrelated causes.

## Mitigation and Recovery

The technical lead selected the lowest-risk action that could restore service quickly. The incident commander recorded the risk, obtained the required emergency approval, and maintained a rollback path. After mitigation, the team completed infrastructure checks, end-user transactions, monitoring validation, and service-owner confirmation before closure.

## Root Cause Analysis

- **Trigger:** Scheduled service-account password rotation.
- **Direct cause:** Backup software attempted repository access with the old password.
- **Root cause:** Credential rotation workflow did not include dependent-system discovery and update verification.
- **Contributing factors:** Failure notifications were email-only; no after-hours page was configured.
- **Failed controls:** Service-account dependency inventory, change checklist, and backup-alert escalation.

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
| MTTA | Within severity target | 30 min | Met |
| Time to mitigation | 07:12 ET | Incident-specific | Met |
| MTTR | 6-hour detection window; 95-minute response | 8 business hr | Met |
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
| CA-1055-01 | Document backup dependency in service-account inventory | Morgan Lee | High | 2026-07-16 | Credential record lists every consuming system | Complete |
| CA-1055-02 | Add post-rotation authentication test | Jamie Christian | High | 2026-07-17 | Change cannot close until test passes | Complete |
| CA-1055-03 | Page on two consecutive production backup failures | Jamie Christian | Medium | 2026-07-20 | Test failures page on-call within 10 min | Complete |
| CA-1055-04 | Perform monthly automated restore test | Morgan Lee | Medium | 2026-08-01 | Restore result appears in monthly scorecard | Complete |

## Validation and Closure

The technical lead confirmed normal component health, logs, monitoring, dependencies, and service transactions. The service owner confirmed the affected business workflow. The incident commander documented residual risk, linked the problem record, issued the final communication, and approved closure.

## Lessons Learned

A successful password rotation is incomplete until every dependent service is discovered, updated, and tested.

## References

`CHG-260714-006`, `PRB-2026-039`, incident bridge transcript, monitoring evidence, validation checklist, final stakeholder communication.
