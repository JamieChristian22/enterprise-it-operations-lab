# Service-Level Objectives

**Owner:** Service Operations  
**Version:** 1.0

## Measurement rules
- Availability excludes approved maintenance windows.
- Acknowledgment time begins when the ticket or alert enters the managed queue.
- Resolution time ends when service is restored, not when documentation is later completed.
- Measurements are reported monthly and reviewed for trends, not isolated blame.

## Objectives
| Service / process | Objective | Warning threshold | Breach threshold |
|---|---:|---:|---:|
| Core identity availability | 99.9% | Below 99.95% | Below 99.9% |
| P1 acknowledgment | 15 min | Above 10 min | Above 15 min |
| P2 acknowledgment | 30 min | Above 20 min | Above 30 min |
| Standard requests | 90% within 1 business day | Below 93% | Below 90% |
| Critical patch compliance | 95% within 14 days | Below 97% | Below 95% |
| Standard patch compliance | 95% within 30 days | Below 97% | Below 95% |
| Backup success | 98% monthly | Below 99% | Below 98% |
| Quarterly restore test | 100% | Any test delayed | Any test failed or missed |
| Privileged MFA coverage | 100% | Any exception open | Any unapproved gap |
| Quarterly access reviews | 100% complete | Below 100% 5 days before due date | Incomplete after due date |

## Error budget approach
A 99.9% monthly availability objective permits approximately 43.8 minutes of unplanned downtime in a 30.4-day month. Repeated consumption of the error budget triggers problem review, reliability work, or a temporary reduction in risky change volume.

## Reporting
Monthly reports include:
- Objective and actual result
- Trend over three months
- Breach explanation
- Business impact
- Corrective action and owner
- Expected completion date

## Governance
Targets are reviewed quarterly. A target may change only when the service owner, technical owner, measurement method, and business justification are documented.
