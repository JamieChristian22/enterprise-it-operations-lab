# Incident Report: Microsoft 365 Outbound Mail-Flow Disruption

## Incident Record

| Field | Value |
|---|---|
| Incident ID | INC-1024 |
| Severity | SEV-2 High |
| Status | Closed |
| Start time | June 24, 2026, 08:14 ET |
| Detection time | June 24, 2026, 08:18 ET |
| Mitigation time | June 24, 2026, 08:49 ET |
| Restoration time | June 24, 2026, 09:22 ET |
| Duration | 68 minutes |
| Incident Commander | Jamie Christian, IT Operations Analyst |
| Technical Lead | Noah Kim, Microsoft 365 Administrator |
| Service Owner | Rachel Owens, Business Services Director |
| Affected service | Exchange Online outbound mail |
| Affected scope | 612 users; external recipients |
| Detection source | Synthetic mail-flow probe M365-MF-07 |
| Related change | CHG-260623-009 |
| Problem record | PRB-2026-024 |

## Executive Summary

A newly enabled outbound connector routed internet mail through an on-premises relay that rejected messages because its connector certificate subject did not match the configured smart-host name. Internal mail continued, while outbound messages queued. The team disabled the connector, restored direct Exchange Online delivery, and replayed queued messages.

## Impact

- 612 users could not send mail to external recipients.
- 1,846 messages were delayed; none were lost.
- Customer service and vendor purchasing workflows were delayed.
- Internal Exchange Online mail and Teams remained available.
- The SEV-2 restoration target was met.

## Severity Justification

A majority of employees lost an externally facing Tier-1 communication capability, but internal collaboration remained available.

## Detection

The first actionable signal was received at 08:18 ET from Synthetic mail-flow probe M365-MF-07. The on-call analyst validated the alert against a real service transaction, determined scope, and assigned severity using the incident severity matrix.

## Timeline

| Time ET | Event / Decision | Owner | Evidence |
|---|---|---|---|
| 08:14 | Synthetic external message entered retry state | Monitoring | M365-MF-07 |
| 08:18 | Alert acknowledged; message trace confirmed outbound queue growth | Jamie Christian | TRACE-1024-01 |
| 08:24 | SEV-2 declared and Microsoft 365 bridge opened | Incident Commander | BRIDGE-1024 |
| 08:31 | Service Health showed no Microsoft platform incident | M365 Admin | SHD-1024 |
| 08:37 | Connector TLS error isolated in relay logs | M365 Admin | RELAY-TLS-1024 |
| 08:44 | Rollback risk reviewed; change owner approved disablement | Incident Commander | DEC-1024-01 |
| 08:49 | Outbound connector disabled; direct delivery restored | M365 Admin | CHG-EMG-260624-01 |
| 09:03 | Synthetic messages delivered to three external domains | Technical Lead | VAL-1024-01 |
| 09:16 | Queued-message count returned to baseline | Monitoring | TRACE-1024-02 |
| 09:22 | Business validation completed; incident closed | Incident Commander | CLOSE-1024 |

## Technical Investigation

- Microsoft 365 Service Health showed no active Exchange Online incident.
- Message trace showed `Pending` and connector-routing events for external domains.
- Relay logs reported TLS certificate name mismatch.
- Inbound and internal messages passed, isolating the fault to the outbound connector.
- DNS MX, SPF, DKIM, and internet reachability were normal.
- A connector created under CHG-260623-009 had been enabled without an end-to-end external-domain test.

The team used service-specific logs, monitoring, recent-change review, dependency checks, and direct transaction tests to isolate the fault and eliminate unrelated causes.

## Mitigation and Recovery

The technical lead selected the lowest-risk action that could restore service quickly. The incident commander recorded the risk, obtained the required emergency approval, and maintained a rollback path. After mitigation, the team completed infrastructure checks, end-user transactions, monitoring validation, and service-owner confirmation before closure.

## Root Cause Analysis

- **Trigger:** Activation of the new outbound mail connector.
- **Direct cause:** Relay rejected Exchange Online TLS because the certificate subject did not match the smart-host name.
- **Root cause:** The change test plan validated TCP reachability but omitted certificate-name and end-to-end external delivery tests.
- **Contributing factors:** Rollback criteria were not pre-defined; connector monitoring only checked availability, not successful delivery.
- **Failed controls:** Change validation, certificate lifecycle review, and synthetic outbound testing.

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
| Time to mitigation | 08:49 ET | Incident-specific | Met |
| MTTR | 68 minutes | 240 min | Met |
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
| CA-1024-01 | Add external-domain delivery test to connector changes | Noah Kim | High | 2026-06-26 | Test to three domains must pass before enablement | Complete |
| CA-1024-02 | Add certificate-name validation script | Jamie Christian | High | 2026-06-30 | Script detects mismatch before production change | Complete |
| CA-1024-03 | Create connector rollback runbook | Noah Kim | Medium | 2026-07-02 | Rollback completed in test in under 10 min | Complete |
| CA-1024-04 | Alert on outbound queue growth and delivery latency | Jamie Christian | Medium | 2026-07-03 | Alert fires at 50 queued or 5-min delay | Complete |

## Validation and Closure

The technical lead confirmed normal component health, logs, monitoring, dependencies, and service transactions. The service owner confirmed the affected business workflow. The incident commander documented residual risk, linked the problem record, issued the final communication, and approved closure.

## Lessons Learned

A reachable mail relay is not a validated mail path. Connector changes require end-to-end delivery, TLS identity, queue, and rollback testing.

## References

`CHG-260623-009`, `PRB-2026-024`, incident bridge transcript, monitoring evidence, validation checklist, final stakeholder communication.
