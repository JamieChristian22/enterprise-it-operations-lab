# Hyper-V Live Migration

## Purpose

Move a running clustered VM without planned outage.

## Scope and Prerequisites

- Approved request or change record
- Current backup or recovery point when applicable
- Administrative access using a named account
- Confirmed capacity and dependency health
- Defined maintenance window and owner communication

## Prechecks

```powershell
Get-ClusterNode
Get-ClusterGroup PRD-APP-03
Test-Cluster -Node HV01,HV02
```

## Procedure

Confirm destination memory, CPU compatibility, storage access, and migration-network health.

```powershell
Move-ClusterVirtualMachineRole -Name "PRD-APP-03" -Node "HV02"
```

## Validation

```powershell
Get-ClusterGroup PRD-APP-03
Get-VM -ComputerName HV02 -Name PRD-APP-03
Test-Connection PRD-APP-03 -Count 4
```

- Repeat the original workflow.
- Review logs and monitoring for new errors.
- Confirm storage, network, guest tools, and backup health.
- Obtain owner confirmation for production services.

## Rollback

Move the VM back to HV01 if application or performance validation fails.

## Escalation Criteria

Escalate for repeated authentication, delegation, storage, or cluster-network failures.

## Evidence to Retain

- Before-and-after command output
- Change or incident reference
- Capacity and health results
- Validation record
- Owner confirmation
