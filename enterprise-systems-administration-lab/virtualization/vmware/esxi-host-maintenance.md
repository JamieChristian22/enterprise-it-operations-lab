# ESXi Host Maintenance

## Purpose

Patch or service an ESXi host with controlled evacuation.

## Scope and Prerequisites

- Approved request or change record
- Current backup or recovery point when applicable
- Administrative access using a named account
- Confirmed capacity and dependency health
- Defined maintenance window and owner communication

## Prechecks

```powershell
Connect-VIServer VCENTER01
Get-VMHost ESX01
Get-VM -Location ESX01
```

## Procedure

Confirm remaining cluster capacity, then enter maintenance mode, patch, reboot, validate hardware/storage/networking, and return the host.

```powershell
Set-VMHost ESX01 -State Maintenance
# Apply approved baseline
Set-VMHost ESX01 -State Connected
```

## Validation

```powershell
Get-VMHost ESX01
Get-Datastore
```

- Repeat the original workflow.
- Review logs and monitoring for new errors.
- Confirm storage, network, guest tools, and backup health.
- Obtain owner confirmation for production services.

## Rollback

Boot the prior image profile or leave the host in maintenance while workloads remain on ESX02/ESX03.

## Escalation Criteria

Escalate if VMs cannot evacuate, the host cannot reconnect, or storage/networking is unhealthy.

## Evidence to Retain

- Before-and-after command output
- Change or incident reference
- Capacity and health results
- Validation record
- Owner confirmation
