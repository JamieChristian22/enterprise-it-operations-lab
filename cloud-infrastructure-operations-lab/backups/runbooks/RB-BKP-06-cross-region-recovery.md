# Cross-Region Recovery

## Declaration criteria

Use when the primary region cannot meet RTO, recovery points in the primary vault are inaccessible, or a scheduled disaster-recovery exercise is underway.

## Sequence

1. Incident commander declares cross-region recovery and activates the communications plan.
2. Confirm KMS/key access, network baseline, quotas, DNS permissions, and copied recovery-point availability in the secondary region.
3. Restore Terraform state and foundational networking first.
4. Restore databases, then application compute, then monitoring and support services.
5. Keep DNS TTL low only during the controlled change; record the previous values.
6. Validate data timestamp against RPO, run synthetic transactions, and obtain service-owner approval.
7. Shift traffic in stages and monitor error rate, latency, saturation, and business transaction success.
8. Keep the primary environment isolated until corruption and replication risks are understood.

## Failback

Failback requires a separate approved plan covering data reconciliation, replication direction, traffic shift, rollback criteria, and final backup validation.
