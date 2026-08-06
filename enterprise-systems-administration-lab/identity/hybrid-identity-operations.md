# Hybrid Identity Operations

## Objective
Maintain reliable synchronization between on-premises Active Directory and Microsoft Entra ID while preventing duplicate identities, unexpected attribute changes, and unplanned authentication impact.

## Operating Model
- `NS-AADCON01` is the active Microsoft Entra Connect server.
- `NS-AADCON02` remains in staging mode and receives matching configuration.
- Password Hash Synchronization is the primary sign-in method.
- The `ms-DS-ConsistencyGuid` attribute is used as the source anchor.
- The routable user principal name suffix is `northstarlab.com`.

## Daily Health Review
1. Confirm both synchronization servers are online.
2. Review the latest scheduler status and connector run history.
3. Confirm the last successful delta synchronization completed within 30 minutes.
4. Review export errors, duplicate attributes, permission failures, and stopped-extension errors.
5. Verify password hash synchronization heartbeat and recent success.
6. Confirm staging mode remains enabled on the standby server.
7. Record exceptions in the operations log and create an incident for unresolved errors.

## Pre-Change Controls
- Approved change record and maintenance window
- Current Entra Connect configuration export
- Verified recent Active Directory backup
- Duplicate `proxyAddresses`, UPN, and mail attribute scan
- Source-anchor consistency validation
- Named rollback owner and escalation contact

## Common Failure Scenarios

### Duplicate proxy address
Locate all objects with the conflicting address, determine the authoritative identity, remove the invalid value, run a delta synchronization, and validate the cloud object.

### UPN mismatch
Confirm the routable suffix exists in Active Directory Domains and Trusts, update the user UPN, validate sign-in impact, and synchronize.

### Soft-match conflict
Compare cloud and on-premises mail, UPN, immutable ID, and source-anchor values. Do not force a match until ownership and object history are validated.

### Export permission failure
Validate the connector account, password state, directory permissions, and service health before retrying the export.

## Escalation Criteria
Escalate when more than 25 objects fail, privileged identities are affected, synchronization is unavailable for more than 60 minutes, source-anchor corruption is suspected, or remediation requires destructive cloud-object changes.

## Recovery Principle
Pause, preserve evidence, restore the last known good configuration, perform a controlled synchronization, and validate a representative pilot group before broad completion.
