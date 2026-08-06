# Incident Report: Virtualization Host Resource Exhaustion

## Incident Record

| Field | Value |
|---|---|
| Incident ID | INC-1071 |
| Severity | SEV-2 High |
| Status | Closed |
| Start time | July 29, 2026, 11:20 ET |
| Detection time | July 29, 2026, 11:24 ET |
| Mitigation time | July 29, 2026, 11:51 ET |
| Restoration time | July 29, 2026, 12:17 ET |
| Duration | 57 minutes |
| Incident Commander | Jamie Christian, IT Operations Analyst |
| Technical Lead | Morgan Lee, Systems Administrator |
| Service Owner | Priya Shah, Infrastructure Manager |
| Affected service | VMware virtual server platform |
| Affected scope | 18 VMs; five user-facing applications degraded |
| Detection source | vCenter CPU-ready and memory-ballooning alerts |
| Related change | CHG-260729-004 |
| Problem record | PRB-2026-047 |

## Executive Summary

An analytics VM was increased from 8 to 32 vCPUs without a cluster-capacity check, causing high CPU ready time and memory pressure on host ESX-03. Five applications slowed or timed out. The team vMotioned workloads, reduced the VM allocation, and rebalanced the cluster.

## Impact

- Five applications experienced response times above 20 seconds.
- 18 virtual machines showed elevated CPU ready or memory ballooning.
- 63 users reported delay or timeout symptoms.
- No VM crashed and no data was lost.
- The SEV-2 restoration target was met.

## Severity Justification

Multiple business applications were materially degraded due to shared infrastructure contention, affecting more than 10% of users.

## Detection

The first actionable signal was received at 11:24 ET from vCenter CPU-ready and memory-ballooning alerts. The on-call analyst validated the alert against a real service transaction, determined scope, and assigned severity using the incident severity matrix.

## Timeline

| Time ET | Event / Decision | Owner | Evidence |
|---|---|---|---|
| 11:20 | Analytics workload spike began after VM resize | vCenter | VC-EVT-1071 |
| 11:24 | CPU-ready and ballooning alerts triggered | Monitoring | VC-ALERT-1071 |
| 11:29 | Host ESX-03 isolated as common dependency | Systems | VC-ANALYSIS-1071 |
| 11:34 | SEV-2 declared; recent changes reviewed | Jamie Christian | BRIDGE-1071 |
| 11:42 | 32-vCPU resize identified under CHG-260729-004 | Systems | CHG-260729-004 |
| 11:47 | vMotion plan approved; DRS set to aggressive | Incident Commander | DEC-1071-01 |
| 11:51 | Four application VMs moved to ESX-01/02 | Systems | VC-MOTION-1071 |
| 12:02 | Analytics VM reduced to 12 vCPU after workload pause | Systems | CHG-EMG-260729-05 |
| 12:10 | CPU ready below 5%; application probes normal | Monitoring | VAL-1071-01 |
| 12:17 | Business owners confirmed recovery; incident closed | Incident Commander | CLOSE-1071 |

## Technical Investigation

- Storage latency and network packet loss were normal.
- ESX-03 CPU ready exceeded 28% and memory ballooning exceeded 18 GB.
- The analytics VM had been resized from 8 to 32 vCPUs earlier that morning.
- The VM workload used fewer than 10 vCPUs effectively, creating scheduling contention.
- DRS automation was partially manual due to a previous maintenance setting.
- Capacity approval was not required for standard VM resize changes.

The team used service-specific logs, monitoring, recent-change review, dependency checks, and direct transaction tests to isolate the fault and eliminate unrelated causes.

## Mitigation and Recovery

The technical lead selected the lowest-risk action that could restore service quickly. The incident commander recorded the risk, obtained the required emergency approval, and maintained a rollback path. After mitigation, the team completed infrastructure checks, end-user transactions, monitoring validation, and service-owner confirmation before closure.

## Root Cause Analysis

- **Trigger:** Analytics processing began after a large VM resize.
- **Direct cause:** Oversized VM and reduced DRS automation caused CPU scheduling and memory contention.
- **Root cause:** VM resize changes were not governed by cluster-capacity and right-sizing controls.
- **Contributing factors:** DRS remained partially manual after maintenance; alert thresholds did not page until user impact.
- **Failed controls:** Capacity review, post-change validation, maintenance-state restoration, and rightsizing policy.

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
| Time to mitigation | 11:51 ET | Incident-specific | Met |
| MTTR | 57 minutes | 240 min | Met |
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
| CA-1071-01 | Require capacity check for VM resize above 25% | Morgan Lee | High | 2026-07-31 | Change template blocks approval without report | Complete |
| CA-1071-02 | Alert when DRS leaves fully automated mode | Jamie Christian | High | 2026-07-30 | Page occurs within five minutes | Complete |
| CA-1071-03 | Run monthly VM rightsizing report | Morgan Lee | Medium | 2026-08-03 | Oversized/undersized VMs reviewed monthly | Complete |
| CA-1071-04 | Lower CPU-ready warning to 8% and critical to 15% | Jamie Christian | Medium | 2026-07-30 | Synthetic load test triggers both levels | Complete |

## Validation and Closure

The technical lead confirmed normal component health, logs, monitoring, dependencies, and service transactions. The service owner confirmed the affected business workflow. The incident commander documented residual risk, linked the problem record, issued the final communication, and approved closure.

## Lessons Learned

More vCPUs can reduce performance in a shared scheduler. VM changes must be capacity-aware and validated at the application level.

## References

`CHG-260729-004`, `PRB-2026-047`, incident bridge transcript, monitoring evidence, validation checklist, final stakeholder communication.
