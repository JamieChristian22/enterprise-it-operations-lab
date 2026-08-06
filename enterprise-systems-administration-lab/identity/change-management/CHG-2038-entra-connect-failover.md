# CHG-2038 — Entra Connect Planned Failover

**Status:** Completed successfully  
**Risk:** Medium  
**Window:** 2026-07-10 22:00–23:00 ET

## Business Reason
Move synchronization from `NS-AADCON01` to `NS-AADCON02` to patch and validate the primary server without interrupting identity operations.

## Pre-Change Validation
- Configuration versions matched.
- Standby server confirmed healthy and in staging mode.
- Latest configuration export and VM backup completed.
- Duplicate-attribute scan returned no unresolved conflicts.
- Stakeholders and service desk notified.

## Implementation
1. Disabled the scheduler on `NS-AADCON01`.
2. Verified no connector operation remained active.
3. Disabled staging mode on `NS-AADCON02`.
4. Confirmed scheduler activation.
5. Ran one delta synchronization.
6. Validated pilot user, group, disabled account, and password hash synchronization.

## Result
Synchronization completed successfully with 42 updates, zero export errors, and no unexpected deletions.

## Rollback Plan
Re-enable staging mode on `NS-AADCON02`, restore the last known-good configuration on `NS-AADCON01`, validate scheduler ownership, and run a controlled delta cycle.

## Approval and Closure
Approved by Infrastructure Operations and Security Operations. Closed after 30 minutes of healthy monitoring and Service Desk confirmation of no authentication incidents.
