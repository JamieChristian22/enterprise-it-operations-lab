# Monthly Backup Scorecard — July 2026

## Executive result

Backup controls remained effective. One AWS EBS snapshot job failed because the source volume was temporarily in a transitional state; the retry completed within 18 minutes and did not breach RPO.

| Metric | Target | Result | Status |
|---|---:|---:|---|
| Protected-resource coverage | 100% | 100% | Met |
| Backup job success | >= 98% | 99.55% | Met |
| RPO compliance | 100% | 100% | Met |
| Restore-test pass rate | 100% | 100% | Met |
| Tier 0 test freshness | <= 31 days | 14 days | Met |
| Unresolved failed jobs | 0 | 0 | Met |
| Open policy exceptions | 0 | 0 | Met |

## Corrective action

The EBS failure event rule and operations alert were verified. The affected volume completed a successful backup at 03:18 UTC, and the asset remained within its four-hour RPO. No management escalation was required.
