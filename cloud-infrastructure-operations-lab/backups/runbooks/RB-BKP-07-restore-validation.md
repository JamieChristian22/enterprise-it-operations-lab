# Restore Validation Standard

Every restore test must validate five control groups:

1. **Recovery-point identity:** correct resource, timestamp, region, retention class, encryption key, and job ID.
2. **Infrastructure:** instance starts, filesystem mounts, networking is restricted, monitoring is active, and no critical service is failed.
3. **Data integrity:** checksums, record counts, transaction totals, and application-specific consistency checks pass.
4. **Security:** least-privilege access, encryption, secrets handling, logging, endpoint protection, and vulnerability controls remain active.
5. **Operational readiness:** health checks, user workflow, backup reassignment, cleanup, evidence, RPO, and RTO are complete.

A test fails if any critical integrity check fails, the recovery point exceeds RPO, actual recovery exceeds RTO without approved exception, or the recovered system bypasses required security controls.
