# VMware Snapshot Governance

## Purpose

Audit and remove temporary snapshots safely.

## Scope and Prerequisites

- Approved request or change record
- Current backup or recovery point when applicable
- Administrative access using a named account
- Confirmed capacity and dependency health
- Defined maintenance window and owner communication

## Prechecks

```powershell
Get-VM | Get-Snapshot
```

## Procedure

Normal maximum age: 3 days. Exception maximum: 7 days with approval.

```powershell
Get-VM PRD-WEB-02 | Get-Snapshot -Name "CHG-2026-0042-prepatch" | Remove-Snapshot -Confirm:$false
```

## Validation

```powershell
Get-VM PRD-WEB-02 | Get-Snapshot
Get-Datastore
```

- Repeat the original workflow.
- Review logs and monitoring for new errors.
- Confirm storage, network, guest tools, and backup health.
- Obtain owner confirmation for production services.

## Rollback

Restore the approved snapshot only when application-consistent; otherwise use backup recovery.

## Escalation Criteria

Escalate consolidation failure, large delta growth, or critical datastore capacity.

## Evidence to Retain

- Before-and-after command output
- Change or incident reference
- Capacity and health results
- Validation record
- Owner confirmation
