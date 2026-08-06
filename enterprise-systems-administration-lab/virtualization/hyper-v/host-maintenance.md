# Hyper-V Host Maintenance

## Purpose

Safely patch or service a cluster node.

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
Get-VM -ComputerName HV01
```

## Procedure

Drain roles, patch, reboot, validate, and resume.

```powershell
Suspend-ClusterNode HV01 -Drain
# Apply approved maintenance
Resume-ClusterNode HV01 -Failback NoFailback
```

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

Keep the node paused, remove the failed update or driver, and continue running workloads on HV02.

## Escalation Criteria

Escalate if workloads cannot drain, the node cannot rejoin, or cluster storage/networking is degraded.

## Evidence to Retain

- Before-and-after command output
- Change or incident reference
- Capacity and health results
- Validation record
- Owner confirmation
