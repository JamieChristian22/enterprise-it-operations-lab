# VMware DRS and Affinity Rules

## Purpose

Govern automated placement and separation requirements.

## Scope and Prerequisites

- Approved request or change record
- Current backup or recovery point when applicable
- Administrative access using a named account
- Confirmed capacity and dependency health
- Defined maintenance window and owner communication

## Prechecks

```powershell
Get-Cluster PROD-CLUSTER | Get-DrsRule
Get-Cluster PROD-CLUSTER | Get-DrsClusterGroup
```

## Procedure

Use anti-affinity for redundant domain controllers and other failure-domain pairs. Prefer soft rules unless hard placement is mandatory. Record owner, rationale, review date, and rollback.

## Validation

```powershell
Get-Cluster PROD-CLUSTER | Get-DrsRule
```

- Repeat the original workflow.
- Review logs and monitoring for new errors.
- Confirm storage, network, guest tools, and backup health.
- Obtain owner confirmation for production services.

## Rollback

Disable or remove the new rule and allow DRS to rebalance.

## Escalation Criteria

Escalate unresolved rule violations or rules that prevent HA restart placement.

## Evidence to Retain

- Before-and-after command output
- Change or incident reference
- Capacity and health results
- Validation record
- Owner confirmation
