# VMware Datastore Capacity Management

## Purpose

Monitor and remediate VMware storage capacity.

## Scope and Prerequisites

- Approved request or change record
- Current backup or recovery point when applicable
- Administrative access using a named account
- Confirmed capacity and dependency health
- Defined maintenance window and owner communication

## Prechecks

```powershell
Connect-VIServer VCENTER01
Get-Datastore
```

## Procedure

Warning threshold: less than 25 percent free. Critical threshold: less than 15 percent. Remove approved stale snapshots, Storage vMotion selected VMs, expand storage, retire abandoned VMs, or archive templates.

## Validation

```powershell
Get-Datastore | Select Name,CapacityGB,FreeSpaceGB
```

- Repeat the original workflow.
- Review logs and monitoring for new errors.
- Confirm storage, network, guest tools, and backup health.
- Obtain owner confirmation for production services.

## Rollback

Move the VM back or restore the prior datastore presentation if a storage change fails.

## Escalation Criteria

Escalate for datastore inaccessibility, APD/PDL conditions, or less than 10 percent free.

## Evidence to Retain

- Before-and-after command output
- Change or incident reference
- Capacity and health results
- Validation record
- Owner confirmation
