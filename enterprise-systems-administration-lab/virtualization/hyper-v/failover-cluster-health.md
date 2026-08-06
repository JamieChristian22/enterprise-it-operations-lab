# Hyper-V Failover Cluster Health

## Purpose

Perform daily and post-change cluster validation.

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
Get-ClusterQuorum
Get-ClusterNetwork
```

## Procedure

Review node, role, CSV, quorum, and network state. Run full `Test-Cluster` after major storage, network, or hardware changes.

## Validation

```powershell
Test-Cluster -Node HV01,HV02
Get-WinEvent -LogName "Microsoft-Windows-FailoverClustering/Operational" -MaxEvents 200
```

- Repeat the original workflow.
- Review logs and monitoring for new errors.
- Confirm storage, network, guest tools, and backup health.
- Obtain owner confirmation for production services.

## Rollback

Undo the triggering change or keep the unhealthy node paused while workloads remain on the healthy node.

## Escalation Criteria

Escalate P1 for quorum loss, multiple node failure, CSV unavailability, or critical VM start failure.

## Evidence to Retain

- Before-and-after command output
- Change or incident reference
- Capacity and health results
- Validation record
- Owner confirmation
