# Backup Job Failure Response

## Initial triage

1. Record provider, vault, resource, job ID, start time, status, error code, and last successful recovery point.
2. Determine whether current RPO is already breached or will be breached before the next attempt.
3. Check identity permissions, KMS/key status, vault policy, resource state, service quotas, network reachability, and provider service health.
4. Retry only after the failure condition is understood; repeated blind retries are not acceptable.

## Common corrective actions

- Access denied: validate role trust, resource policy, and KMS grants.
- Resource not found: reconcile inventory and tags; identify deletion or replacement change.
- Snapshot quota: remove expired non-held recovery points or request quota increase.
- Key unavailable: restore key access through the security incident process.
- Vault locked: use the approved vault and policy; do not weaken immutability.
- Agent/extension failure: repair the agent, validate heartbeat, then rerun the job.

## Escalation

Escalate immediately for Tier 0 RPO breach, two consecutive Tier 1 failures, suspected malicious deletion, unavailable encryption key, or evidence that backups are corrupted.
