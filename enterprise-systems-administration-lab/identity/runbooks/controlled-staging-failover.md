# Runbook — Controlled Staging Server Failover

## Preconditions
- Approved emergency or planned change
- Active server failure confirmed or maintenance approved
- Configuration parity confirmed
- Standby server healthy and in staging mode
- Current backups and configuration exports available

## Procedure
1. Disable the scheduler on the failed or retiring active server when reachable.
2. Verify no export operation is still running.
3. On `NS-AADCON02`, open Entra Connect configuration and disable staging mode.
4. Confirm the scheduler becomes active.
5. Run one initial delta cycle.
6. Review import, synchronization, export, and password hash synchronization results.
7. Validate pilot identities: standard user, group, disabled account, and privileged test account.
8. Monitor alerts and authentication for 30 minutes.
9. Update the change record and configuration inventory.

## Rollback
Re-enable staging mode on `NS-AADCON02`, restore the known-good active server only after validating configuration and database state, then conduct a controlled resumption.
