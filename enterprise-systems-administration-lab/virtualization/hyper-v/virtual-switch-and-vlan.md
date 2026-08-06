# Hyper-V Virtual Switch and VLAN Configuration

## Purpose

Create and validate Hyper-V virtual networking.

## Scope and Prerequisites

- Approved request or change record
- Current backup or recovery point when applicable
- Administrative access using a named account
- Confirmed capacity and dependency health
- Defined maintenance window and owner communication

## Prechecks

```powershell
Get-NetAdapter
Get-VMSwitch
Get-VMNetworkAdapter -All
```

## Procedure

Create the external switch and configure the VM access VLAN.

```powershell
New-VMSwitch -Name "vSwitch-Production" -NetAdapterName "NIC-Production" -AllowManagementOS $false
Set-VMNetworkAdapterVlan -VMName "PRD-APP-03" -Access -VlanId 120
```

## Validation

```powershell
Get-VMNetworkAdapterVlan PRD-APP-03
Test-Connection 10.120.0.1 -Count 4
```

- Repeat the original workflow.
- Review logs and monitoring for new errors.
- Confirm storage, network, guest tools, and backup health.
- Obtain owner confirmation for production services.

## Rollback

Reconnect the prior switch and restore the previous VLAN.

## Escalation Criteria

Escalate for upstream trunk mismatch, SET failure, or loss of host management connectivity.

## Evidence to Retain

- Before-and-after command output
- Change or incident reference
- Capacity and health results
- Validation record
- Owner confirmation
