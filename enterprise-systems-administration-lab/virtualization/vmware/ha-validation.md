# VMware HA Validation

## Purpose

Verify cluster restart capacity and failover readiness.

## Scope and Prerequisites

- Approved request or change record
- Current backup or recovery point when applicable
- Administrative access using a named account
- Confirmed capacity and dependency health
- Defined maintenance window and owner communication

## Prechecks

```powershell
Get-Cluster PROD-CLUSTER
```

## Procedure

Confirm HA, admission control, datastore heartbeating, isolation response, management-network redundancy, restart priorities, and capacity for one host failure. Perform controlled test recovery with a noncritical VM.

## Validation

```powershell
Get-Cluster PROD-CLUSTER | Select Name,HAEnabled,HAAdmissionControlEnabled
```

- Repeat the original workflow.
- Review logs and monitoring for new errors.
- Confirm storage, network, guest tools, and backup health.
- Obtain owner confirmation for production services.

## Rollback

Restore the prior HA settings and end the test.

## Escalation Criteria

Escalate if HA cannot satisfy configured failover capacity or protected VMs show placement errors.

## Evidence to Retain

- Before-and-after command output
- Change or incident reference
- Capacity and health results
- Validation record
- Owner confirmation
