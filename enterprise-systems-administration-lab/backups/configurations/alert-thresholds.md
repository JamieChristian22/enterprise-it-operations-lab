# Monitoring and Alert Thresholds

| Condition | Severity | Response |
|---|---|---|
| Job failed | Critical | Open incident immediately; retry after cause analysis |
| No recovery point within RPO | Critical | Escalate to Infrastructure Lead |
| Repository free space below 20% | Warning | Capacity review within one business day |
| Repository free space below 10% | Critical | Suspend nonessential jobs and expand storage |
| Checksum mismatch | Critical | Quarantine recovery point and investigate integrity |
| Offsite copy older than 24 hours | High | Restore connectivity and rerun copy job |
| Monthly restore test missed | High | Complete within two business days and document exception |
