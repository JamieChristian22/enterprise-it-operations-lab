# vCenter and Cluster Health

## Purpose

Validate vCenter, hosts, HA, DRS, datastores, and alarms.

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
Get-VMHost
Get-Datastore
```

## Procedure

Review host connection state, HA/DRS configuration, unresolved critical alarms, datastore capacity, backup integration, and monitoring connectivity.

## Validation

```powershell
Get-Cluster PROD-CLUSTER | Select Name,HAEnabled,HAAdmissionControlEnabled,DrsEnabled,DrsAutomationLevel
Get-AlarmDefinition
```

- Repeat the original workflow.
- Review logs and monitoring for new errors.
- Confirm storage, network, guest tools, and backup health.
- Obtain owner confirmation for production services.

## Rollback

Undo the triggering configuration change or manage hosts directly while vCenter recovery proceeds.

## Escalation Criteria

Escalate P1 for multiple disconnected hosts, datastore loss, or failed HA protection.

## Evidence to Retain

- Before-and-after command output
- Change or incident reference
- Capacity and health results
- Validation record
- Owner confirmation
