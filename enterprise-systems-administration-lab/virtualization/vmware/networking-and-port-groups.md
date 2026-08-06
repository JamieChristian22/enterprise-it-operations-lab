# VMware Networking and Port Groups

## Purpose

Manage distributed-switch port groups and VLAN assignment.

## Scope and Prerequisites

- Approved request or change record
- Current backup or recovery point when applicable
- Administrative access using a named account
- Confirmed capacity and dependency health
- Defined maintenance window and owner communication

## Prechecks

```powershell
Get-VDSwitch
Get-VDPortgroup
Get-VMHostNetworkAdapter
```

## Procedure

Confirm the distributed switch, uplinks, teaming, VLAN, and host consistency before changing a VM network adapter.

```powershell
Get-VM PRD-APP-04 | Get-NetworkAdapter | Set-NetworkAdapter -Portgroup (Get-VDPortgroup PG-Production) -Confirm:$false
```

## Validation

```powershell
Get-VM PRD-APP-04 | Get-NetworkAdapter
Get-VDPortgroup PG-Production
```

- Repeat the original workflow.
- Review logs and monitoring for new errors.
- Confirm storage, network, guest tools, and backup health.
- Obtain owner confirmation for production services.

## Rollback

Reconnect the prior port group.

## Escalation Criteria

Escalate for host uplink failure, distributed-switch inconsistency, or management-network loss.

## Evidence to Retain

- Before-and-after command output
- Change or incident reference
- Capacity and health results
- Validation record
- Owner confirmation
