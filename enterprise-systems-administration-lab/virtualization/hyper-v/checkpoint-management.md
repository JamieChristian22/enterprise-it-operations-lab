# Hyper-V Checkpoint Governance

## Purpose

Create, audit, and remove temporary production checkpoints safely.

## Scope and Prerequisites

- Approved request or change record
- Current backup or recovery point when applicable
- Administrative access using a named account
- Confirmed capacity and dependency health
- Defined maintenance window and owner communication

## Prechecks

```powershell
Get-VM | Get-VMSnapshot
```

## Procedure

Use production checkpoints only. Normal maximum age is 3 days; exception maximum is 7 days.

```powershell
Set-VM PRD-WEB-02 -CheckpointType Production
Checkpoint-VM PRD-WEB-02 -SnapshotName "CHG-2026-0041-prepatch"
Remove-VMSnapshot -VMName PRD-WEB-02 -Name "CHG-2026-0041-prepatch"
```

## Validation

```powershell
Get-VM PRD-WEB-02 | Get-VMSnapshot
Get-ClusterSharedVolume
```

- Repeat the original workflow.
- Review logs and monitoring for new errors.
- Confirm storage, network, guest tools, and backup health.
- Obtain owner confirmation for production services.

## Rollback

Restore the checkpoint only when formally approved and application-consistent; otherwise remove it and restore from backup if required.

## Escalation Criteria

Escalate if AVHDX merge fails, disk chain is inconsistent, or free storage falls below 15 percent.

## Evidence to Retain

- Before-and-after command output
- Change or incident reference
- Capacity and health results
- Validation record
- Owner confirmation
