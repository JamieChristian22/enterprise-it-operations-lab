# Monthly Backup Operations Report — July 2026

## Executive Summary
Backup services met all documented RPO and RTO targets. Job success was 99.6%; the single failed job was remediated within 45 minutes and did not breach RPO. Four restore tests passed with verified integrity.

## KPIs
| Metric | Result | Target | Status |
|---|---:|---:|---|
| Backup job success | 99.6% | >= 98% | Met |
| Assets within RPO | 100% | 100% | Met |
| Restore test pass rate | 100% | 100% | Met |
| Critical failures unresolved >4h | 0 | 0 | Met |
| Primary repository free space | 39.25% | >20% | Met |
| Offsite recovery point age | 5h 45m | <24h | Met |

## Work Completed
- Implemented offline recovery copy.
- Completed isolated Active Directory recovery exercise.
- Added VSS writer preflight checks.
- Corrected unexpected APP01 repository growth.

## Next Month
Test bare-metal recovery for FS01 and rotate the backup service credential through the approved secret-management process.
