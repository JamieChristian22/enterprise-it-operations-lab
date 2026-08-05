# Rollback Plan Template

## Rollback Trigger

Rollback begins when the change causes service unavailability, authentication failure, security-control failure, data-integrity risk, or an unsuccessful validation result.

## Recovery Steps

1. Stop implementation activity.
2. Notify the Change Manager and Service Owner.
3. Restore the previous configuration, package, policy, backup, or snapshot.
4. Restart or refresh affected services.
5. Reapply the known-good baseline.
6. Validate service functionality.
7. Confirm user access.
8. Monitor for recurring failure.
9. Document the failure point and recovery evidence.
10. Link any resulting incident.

## Success Criteria

The original service is restored, monitoring is healthy, users can complete the required task, and no new security or data-integrity issue exists.
