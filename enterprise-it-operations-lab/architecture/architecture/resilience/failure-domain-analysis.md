# Failure Domain Analysis

| Failure Domain | Impact | Mitigation |
|---|---|---|
| Single domain controller | Authentication and DNS risk | Multiple DCs |
| Headquarters internet edge | Hybrid connectivity loss | Dual ISP or failover |
| Single AWS AZ | Application disruption | Multi-AZ |
| Monitoring server | Reduced visibility | Backups and secondary alerting |
| Backup repository | Recovery risk | Offsite and immutable copies |
| Issuing CA | Enrollment outage | Backup and documented recovery |
