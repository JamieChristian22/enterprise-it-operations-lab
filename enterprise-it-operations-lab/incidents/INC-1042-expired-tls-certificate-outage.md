# Incident Report: Customer Portal TLS Certificate Outage

## Incident Record

| Field | Value |
|---|---|
| Incident ID | INC-1042 |
| Severity | SEV-1 Critical |
| Status | Closed |
| Start time | July 8, 2026, 06:00 ET |
| Detection time | July 8, 2026, 06:03 ET |
| Mitigation time | July 8, 2026, 06:26 ET |
| Restoration time | July 8, 2026, 06:43 ET |
| Duration | 43 minutes |
| Incident Commander | Jamie Christian, IT Operations Analyst |
| Technical Lead | Avery Chen, Application Engineer |
| Service Owner | Lena Morris, Customer Experience Director |
| Affected service | Public customer self-service portal |
| Affected scope | All external portal users |
| Detection source | HTTPS synthetic transaction and certificate alert |
| Related change | CHG-EMG-260708-01 |
| Problem record | PRB-2026-034 |

## Executive Summary

The public portal certificate expired after renewal ownership remained assigned to a former vendor contact. Browsers rejected the TLS connection. The team issued and installed a replacement certificate, corrected the intermediate chain, and validated the portal from multiple external networks.

## Impact

- The public portal was unavailable to all customers for 43 minutes.
- An estimated 94 login attempts failed.
- Phone support volume increased by 27 calls.
- No customer data was exposed and backend services remained healthy.
- The SEV-1 two-hour restoration target was met.

## Severity Justification

A public Tier-1 customer service was fully unavailable with no browser workaround.

## Detection

The first actionable signal was received at 06:03 ET from HTTPS synthetic transaction and certificate alert. The on-call analyst validated the alert against a real service transaction, determined scope, and assigned severity using the incident severity matrix.

## Timeline

| Time ET | Event / Decision | Owner | Evidence |
|---|---|---|---|
| 06:00 | Certificate expired | Certificate record | CERT-PORTAL-2025 |
| 06:03 | Synthetic HTTPS transaction failed and paged on-call | Monitoring | WEB-PROBE-04 |
| 06:07 | SEV-1 declared after external validation | Jamie Christian | BRIDGE-1042 |
| 06:13 | Application and load balancer health confirmed; TLS isolated | Application | APP-HEALTH-1042 |
| 06:18 | Emergency certificate request approved | Incident Commander | DEC-1042-01 |
| 06:26 | Replacement certificate issued | PKI Admin | PKI-REQ-882 |
| 06:33 | Certificate installed; chain warning detected | Application | TLS-TEST-1042-01 |
| 06:37 | Correct intermediate bundle installed | Application | CHG-EMG-260708-01 |
| 06:41 | External login and account transaction passed | Business Owner | VAL-1042 |
| 06:43 | Incident closed with elevated monitoring | Incident Commander | CLOSE-1042 |

## Technical Investigation

- DNS resolution and load-balancer health were normal.
- TLS inspection showed the leaf certificate expired at 06:00 ET.
- The renewal record referenced a former vendor mailbox.
- Initial replacement lacked one required intermediate certificate.
- Backend application, database, and authentication tests passed over internal TLS.
- No evidence of compromise, interception, or configuration tampering was found.

The team used service-specific logs, monitoring, recent-change review, dependency checks, and direct transaction tests to isolate the fault and eliminate unrelated causes.

## Mitigation and Recovery

The technical lead selected the lowest-risk action that could restore service quickly. The incident commander recorded the risk, obtained the required emergency approval, and maintained a rollback path. After mitigation, the team completed infrastructure checks, end-user transactions, monitoring validation, and service-owner confirmation before closure.

## Root Cause Analysis

- **Trigger:** Certificate reached its expiration time.
- **Direct cause:** Load balancer presented an expired certificate.
- **Root cause:** Certificate lifecycle ownership was not transferred when the vendor contact changed.
- **Contributing factors:** Expiry alerts were sent only to the inactive mailbox; no central certificate inventory owner was accountable.
- **Failed controls:** Asset ownership, alert routing, renewal lead-time review, and chain validation.

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
| MTTA | Within severity target | 5 min | Met |
| Time to mitigation | 06:26 ET | Incident-specific | Met |
| MTTR | 43 minutes | 120 min | Met |
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
| CA-1042-01 | Centralize certificates in owned inventory | Jamie Christian | High | 2026-07-10 | All production certificates have owner and backup owner | Complete |
| CA-1042-02 | Alert at 60, 30, 14, 7, and 3 days | Jamie Christian | High | 2026-07-10 | Test certificate generates each alert | Complete |
| CA-1042-03 | Automate portal certificate renewal | Avery Chen | High | 2026-07-24 | Staging certificate renews without manual action | Complete |
| CA-1042-04 | Add full-chain external TLS validation | Avery Chen | Medium | 2026-07-13 | Probe fails for missing/expired intermediates | Complete |

## Validation and Closure

The technical lead confirmed normal component health, logs, monitoring, dependencies, and service transactions. The service owner confirmed the affected business workflow. The incident commander documented residual risk, linked the problem record, issued the final communication, and approved closure.

## Lessons Learned

Certificate renewal is a service-management process, not a calendar reminder. Ownership, automated renewal, and external chain validation are required.

## References

`CHG-EMG-260708-01`, `PRB-2026-034`, incident bridge transcript, monitoring evidence, validation checklist, final stakeholder communication.
