# VMware VM Recovery

## Purpose

Restore files, virtual disks, or complete VMs.

## Scope and Prerequisites

- Approved request or change record
- Current backup or recovery point when applicable
- Administrative access using a named account
- Confirmed capacity and dependency health
- Defined maintenance window and owner communication

## Prechecks

```powershell
Get-VM
Get-Datastore
```

## Procedure

Confirm restore point, owner, RPO, destination capacity, and identity-isolation plan. Prefer alternate-location restore for testing. Validate boot, guest tools, application, data, monitoring, and backup protection.

## Validation

```powershell
Get-VM PRD-FS-02
Get-VM PRD-FS-02 | Get-VMGuest
```

- Repeat the original workflow.
- Review logs and monitoring for new errors.
- Confirm storage, network, guest tools, and backup health.
- Obtain owner confirmation for production services.

## Rollback

Power off and remove the failed recovered copy, then choose an earlier verified recovery point.

## Escalation Criteria

Escalate when no valid restore point exists, data integrity fails, or duplicate identity is possible.

## Evidence to Retain

- Before-and-after command output
- Change or incident reference
- Capacity and health results
- Validation record
- Owner confirmation
