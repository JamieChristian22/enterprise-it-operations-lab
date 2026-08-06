# Cluster-Aware Updating

## Purpose

Patch clustered Hyper-V nodes sequentially while maintaining availability.

## Scope and Prerequisites

- Approved request or change record
- Current backup or recovery point when applicable
- Administrative access using a named account
- Confirmed capacity and dependency health
- Defined maintenance window and owner communication

## Prechecks

```powershell
Get-ClusterNode
Get-ClusterGroup
Get-ClusterSharedVolume
Test-Cluster -Node HV01,HV02
```

## Procedure

Confirm backups and remaining-node capacity. Start the approved CAU run, monitor drain, patch, reboot, and rejoin for each node, then perform application smoke tests.

## Validation

```powershell
Get-ClusterNode
Get-ClusterGroup
Get-ClusterSharedVolume
```

- Repeat the original workflow.
- Review logs and monitoring for new errors.
- Confirm storage, network, guest tools, and backup health.
- Obtain owner confirmation for production services.

## Rollback

Pause CAU, keep workloads on the healthy node, and remove the failed update from the affected node.

## Escalation Criteria

Escalate if a node does not rejoin, roles remain offline, or patching threatens quorum.

## Evidence to Retain

- Before-and-after command output
- Change or incident reference
- Capacity and health results
- Validation record
- Owner confirmation
