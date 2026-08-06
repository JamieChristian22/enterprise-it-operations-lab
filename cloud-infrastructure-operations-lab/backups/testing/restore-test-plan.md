# 2026 Restore Test Plan

| Test ID | Date | Resource | Tier | Scenario | Owner | Status |
|---|---|---|---:|---|---|---|
| BRT-2026-001 | 2026-01-17 | orders-prod-db | 0 | RDS point-in-time restore | Database Platform | Passed |
| BRT-2026-002 | 2026-02-14 | terraform-state-prod | 0 | S3 version recovery | Cloud Platform | Passed |
| BRT-2026-003 | 2026-03-20 | customer-app-asg | 1 | EBS volume recovery | Cloud Operations | Passed |
| BRT-2026-004 | 2026-04-17 | corp-app-vm01 | 1 | Azure VM isolated restore | Cloud Operations | Passed |
| BRT-2026-005 | 2026-05-15 | orders-prod-db | 0 | Corruption recovery drill | Database Platform | Passed |
| BRT-2026-006 | 2026-06-19 | ops-shared-files | 2 | File-level restore | IT Operations | Passed |
| BRT-2026-007 | 2026-07-18 | orders-prod-db | 0 | RDS PITR and application validation | Database Platform | Passed |
| BRT-2026-008 | 2026-08-21 | terraform-state-prod | 0 | Cross-region version recovery | Cloud Platform | Scheduled |
| BRT-2026-009 | 2026-09-18 | customer-app-asg | 1 | Full EC2 recovery | Cloud Operations | Scheduled |
| BRT-2026-010 | 2026-10-16 | corp-app-vm01 | 1 | Azure regional recovery | Cloud Operations | Scheduled |
