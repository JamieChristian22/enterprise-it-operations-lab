# VMware vMotion

## Purpose

Move a running VM between ESXi hosts.

## Scope and Prerequisites

- Approved request or change record
- Current backup or recovery point when applicable
- Administrative access using a named account
- Confirmed capacity and dependency health
- Defined maintenance window and owner communication

## Prechecks

```powershell
Connect-VIServer VCENTER01
Get-VMHost
Get-VM PRD-APP-04
Get-Datastore
```

## Procedure

Confirm source/destination health, capacity, vMotion networking, storage visibility, port-group consistency, and unsupported-device absence.

```powershell
Move-VM -VM "PRD-APP-04" -Destination "ESX02"
```

## Validation

```powershell
Get-VM PRD-APP-04 | Select Name,VMHost,PowerState
```

- Repeat the original workflow.
- Review logs and monitoring for new errors.
- Confirm storage, network, guest tools, and backup health.
- Obtain owner confirmation for production services.

## Rollback

Move the VM back to the original host.

## Escalation Criteria

Escalate repeated compatibility, network, storage, or admission-control failures.

## Evidence to Retain

- Before-and-after command output
- Change or incident reference
- Capacity and health results
- Validation record
- Owner confirmation
