# Hyper-V Backup and Recovery

## Purpose

Protect and recover VMs using application-aware image backups.

## Scope and Prerequisites

- Approved request or change record
- Current backup or recovery point when applicable
- Administrative access using a named account
- Confirmed capacity and dependency health
- Defined maintenance window and owner communication

## Prechecks

```powershell
Get-VM
Get-VMIntegrationService *
```

## Procedure

Confirm the restore point, owner approval, target capacity, and network-isolation plan. Restore to an alternate path for testing when possible. Validate guest boot, application, data, monitoring, and future backup enrollment.

## Validation

```powershell
Get-VM PRD-FS-01
Test-Connection PRD-FS-01 -Count 4
```

- Repeat the original workflow.
- Review logs and monitoring for new errors.
- Confirm storage, network, guest tools, and backup health.
- Obtain owner confirmation for production services.

## Rollback

Power off and remove the failed restored copy, then select an earlier verified recovery point.

## Escalation Criteria

Escalate when no valid restore point exists, identity-sensitive workloads may duplicate, or data integrity fails.

## Evidence to Retain

- Before-and-after command output
- Change or incident reference
- Capacity and health results
- Validation record
- Owner confirmation
