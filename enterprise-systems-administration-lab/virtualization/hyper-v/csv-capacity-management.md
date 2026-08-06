# Cluster Shared Volume Capacity Management

## Purpose

Monitor and remediate Hyper-V shared-storage capacity.

## Scope and Prerequisites

- Approved request or change record
- Current backup or recovery point when applicable
- Administrative access using a named account
- Confirmed capacity and dependency health
- Defined maintenance window and owner communication

## Prechecks

```powershell
Get-ClusterSharedVolume
Get-Volume
```

## Procedure

Warning threshold: less than 25 percent free. Critical threshold: less than 15 percent. Remove approved stale checkpoints, move VHDX files, expand storage, or retire abandoned VMs.

## Validation

```powershell
Get-ClusterSharedVolume | Format-List *
```

- Repeat the original workflow.
- Review logs and monitoring for new errors.
- Confirm storage, network, guest tools, and backup health.
- Obtain owner confirmation for production services.

## Rollback

Reverse a storage move or restore the prior LUN presentation if a capacity change introduces errors.

## Escalation Criteria

Escalate if the CSV is redirected, offline, or below 10 percent free.

## Evidence to Retain

- Before-and-after command output
- Change or incident reference
- Capacity and health results
- Validation record
- Owner confirmation
