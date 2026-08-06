# VMware Tools Lifecycle

## Purpose

Audit and update VMware Tools.

## Scope and Prerequisites

- Approved request or change record
- Current backup or recovery point when applicable
- Administrative access using a named account
- Confirmed capacity and dependency health
- Defined maintenance window and owner communication

## Prechecks

```powershell
Get-VM | Select Name,@{N="ToolsStatus";E={$_.ExtensionData.Guest.ToolsStatus}}
```

## Procedure

Upgrade during an approved window.

```powershell
Update-Tools -VM PRD-APP-04 -NoReboot
```

## Validation

```powershell
Get-VM PRD-APP-04 | Get-VMGuest
```

- Repeat the original workflow.
- Review logs and monitoring for new errors.
- Confirm storage, network, guest tools, and backup health.
- Obtain owner confirmation for production services.

## Rollback

Reinstall the prior supported tools package or restore the guest snapshot when approved.

## Escalation Criteria

Escalate if guest networking, backup quiescing, or application services regress.

## Evidence to Retain

- Before-and-after command output
- Change or incident reference
- Capacity and health results
- Validation record
- Owner confirmation
