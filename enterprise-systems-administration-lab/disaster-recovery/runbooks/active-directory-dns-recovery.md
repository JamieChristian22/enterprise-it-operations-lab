# Active Directory and DNS Recovery Runbook

## Preconditions
- Security containment confirmed
- Clean recovery network available
- Latest validated system-state backup identified

## Procedure
1. Start the designated recovery domain controller in Directory Services Restore Mode.
2. Restore system state from the approved immutable recovery point.
3. Restart normally and verify SYSVOL and NETLOGON shares.
4. Run `dcdiag /v`, `repadmin /replsummary`, and DNS diagnostics.
5. Confirm FSMO role availability.
6. Validate authentication using a test user from the recovery VLAN.
7. Confirm forward and reverse DNS resolution.
8. Reintroduce additional domain controllers only after the restored controller is healthy.

## Validation
- Domain authentication succeeds
- DNS resolves internal and approved external records
- Replication shows no failures
- SYSVOL and NETLOGON are available
