# VMware VM Provisioning

## Purpose

Deploy a standardized VM from an approved template.

## Scope and Prerequisites

- Approved request or change record
- Current backup or recovery point when applicable
- Administrative access using a named account
- Confirmed capacity and dependency health
- Defined maintenance window and owner communication

## Prechecks

```powershell
Connect-VIServer VCENTER01
Get-Cluster PROD-CLUSTER
Get-Datastore
```

## Procedure

```powershell
New-VM -Name "PRD-APP-04" -Template "TPL-WIN2022-CURRENT" -Datastore "DS-PROD-02" -ResourcePool "PROD-CLUSTER/Resources/Production"
Set-VM PRD-APP-04 -NumCpu 2 -MemoryGB 4 -Confirm:$false
Get-VM PRD-APP-04 | Get-NetworkAdapter | Set-NetworkAdapter -NetworkName "PG-Production" -Confirm:$false
Start-VM PRD-APP-04
```
Apply guest customization, monitoring, backup, ownership tags, and patch group.

## Validation

```powershell
Get-VM PRD-APP-04
Get-VM PRD-APP-04 | Get-VMGuest
```

- Repeat the original workflow.
- Review logs and monitoring for new errors.
- Confirm storage, network, guest tools, and backup health.
- Obtain owner confirmation for production services.

## Rollback

Remove the unused VM and files only after confirming no production data exists.

## Escalation Criteria

Escalate for template failure, insufficient datastore capacity, or cluster placement errors.

## Evidence to Retain

- Before-and-after command output
- Change or incident reference
- Capacity and health results
- Validation record
- Owner confirmation
