# Acceptance Test Plan

| ID | Test | Expected Result | Result |
|---|---|---|---|
| AT-01 | DC01 system-state schedule | Runs every 4 hours | PASS |
| AT-02 | FS01 incremental schedule | Runs every 4 hours | PASS |
| AT-03 | APP01 application-consistent backup | Nightly success | PASS |
| AT-04 | Weekly full backup | Completes in window | PASS |
| AT-05 | Offline copy | Latest verified point copied | PASS |
| AT-06 | Offsite replication | Recovery point under 24 hours old | PASS |
| AT-07 | Repository encryption | BitLocker enabled | PASS |
| AT-08 | Cloud vault protection | MFA, soft delete, purge protection enabled | PASS |
| AT-09 | Service-account restriction | Interactive logon denied | PASS |
| AT-10 | Repository ACL | Unauthorized user denied | PASS |
| AT-11 | Health report | Accurate age and capacity output | PASS |
| AT-12 | Failure alert | Critical alert generated | PASS |
| AT-13 | File restore | Restored with matching hash | PASS |
| AT-14 | Folder ACL restore | Permissions preserved | PASS |
| AT-15 | AD system-state recovery | Isolated recovery succeeds | PASS |
| AT-16 | APP01 VM restore | Application starts successfully | PASS |
| AT-17 | RPO measurement | All services within target | PASS |
| AT-18 | RTO measurement | All exercises within target | PASS |
| AT-19 | Manifest generation | All files inventoried | PASS |
| AT-20 | Checksum validation | Zero mismatches | PASS |
| AT-21 | Capacity threshold | Warning at below 20% | PASS |
| AT-22 | Log retention | 365-day policy documented | PASS |
| AT-23 | Restore authorization | Ticket approval enforced | PASS |
| AT-24 | DR communications | Contact and escalation workflow complete | PASS |

**Final result: 24/24 tests passed.**
