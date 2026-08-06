# Hyper-V Performance Troubleshooting

## Purpose

Diagnose host or VM CPU, memory, storage, and network contention.

## Scope and Prerequisites

- Approved request or change record
- Current backup or recovery point when applicable
- Administrative access using a named account
- Confirmed capacity and dependency health
- Defined maintenance window and owner communication

## Prechecks

```powershell
Get-VM | Select Name,State,ProcessorCount,MemoryAssigned,MemoryDemand
Get-NetAdapterStatistics
```

## Procedure

Compare the affected VM to host and cluster baselines. Review CPU run time, available memory, virtual-storage latency, backup activity, checkpoints, and noisy neighbors.

## Validation

```powershell
Get-Counter "\Hyper-V Hypervisor Logical Processor(_Total)\% Total Run Time"
Get-Counter "\Memory\Available MBytes"
```

- Repeat the original workflow.
- Review logs and monitoring for new errors.
- Confirm storage, network, guest tools, and backup health.
- Obtain owner confirmation for production services.

## Rollback

Return moved or resized workloads to the prior configuration if performance worsens.

## Escalation Criteria

Escalate for sustained storage latency, host hardware errors, or unexplained cluster-wide contention.

## Evidence to Retain

- Before-and-after command output
- Change or incident reference
- Capacity and health results
- Validation record
- Owner confirmation
