# Business Continuity and Recovery Requirements

## Service objectives

| Service | Tier | RPO | RTO | Recovery strategy |
|---|---:|---:|---:|---|
| Orders PostgreSQL | 0 | 15 min | 2 hr | RDS PITR plus cross-region copy |
| Terraform remote state | 0 | 15 min | 1 hr | S3 versioning, replication, object lock |
| Customer application EC2 | 1 | 4 hr | 4 hr | AMI/EBS recovery and Auto Scaling redeploy |
| Azure corporate application VM | 1 | 4 hr | 4 hr | Recovery Services Vault restore |
| Shared operations files | 2 | 24 hr | 8 hr | Versioning and daily protected copy |
| Development cluster data | 3 | 72 hr | 24 hr | Volume snapshot and manifest redeploy |

## Recovery declaration

The incident commander declares disaster recovery when normal remediation cannot meet the service RTO, the primary region is unavailable, corruption has propagated, or the service owner requests recovery from a known-good point.

## Recovery priorities

1. Identity, DNS, networking, encryption keys, and Terraform state.
2. Databases and durable application data.
3. Application compute and load balancing.
4. Monitoring, logging, and operational tooling.
5. Internal and lower-tier services.

## Exit criteria

Recovery is complete when service health checks pass, data reconciliation is accepted by the service owner, monitoring is active, security controls are restored, temporary access is removed, stakeholders are notified, and a post-incident review is scheduled.
