# Runbook — Entra Connect Health Check

## Frequency
Daily and after every identity-related change.

## Procedure
1. Sign in to `NS-MGMT01` with an approved Tier 0 administrative account.
2. Confirm `NS-AADCON01` and `NS-AADCON02` respond to network and service checks.
3. On the active server, run `Get-ADSyncScheduler` and verify the scheduler is enabled.
4. Confirm the most recent delta import, delta synchronization, and export completed successfully.
5. Review connector operations for errors or unusually high object counts.
6. Run `Test-IdentitySyncHealth.ps1` and save the generated evidence file.
7. Verify `NS-AADCON02` remains in staging mode.
8. Review Microsoft Entra Connect Health alerts.
9. Record status as Healthy, Degraded, or Unavailable.

## Success Criteria
- Last successful cycle within 30 minutes
- No unresolved export errors
- Password hash synchronization status healthy
- Standby server in staging mode
- No unexpected deletion threshold alerts

## Escalation
Create a priority incident when privileged identities fail, the service is unavailable for 60 minutes, or more than 25 objects remain in error.
