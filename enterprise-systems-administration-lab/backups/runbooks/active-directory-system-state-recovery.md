# Active Directory System-State Recovery Runbook

## Non-Authoritative Restore
1. Confirm a healthy partner domain controller exists.
2. Isolate the failed DC and validate the selected backup.
3. Boot into Directory Services Restore Mode.
4. Restore system state from the approved recovery point.
5. Restart normally and allow AD replication to update restored objects.
6. Run `dcdiag`, `repadmin /replsummary`, DNS tests, and SYSVOL validation.

## Authoritative Object Restore
1. Obtain Incident Commander and identity-owner approval.
2. Perform the system-state restore in DSRM.
3. Use `ntdsutil` to mark the required object subtree authoritative.
4. Restart and validate replication convergence.
5. Confirm object attributes and group memberships with the owner.

Never connect an isolated restored DC to production until duplicate identity and rollback risks have been assessed.
