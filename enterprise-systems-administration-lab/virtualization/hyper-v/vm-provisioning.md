# Hyper-V VM Provisioning

## Purpose

Provision a standardized clustered Generation 2 VM.

## Scope and Prerequisites

- Approved request or change record
- Current backup or recovery point when applicable
- Administrative access using a named account
- Confirmed capacity and dependency health
- Defined maintenance window and owner communication

## Prechecks

```powershell
Get-ClusterNode
Get-ClusterSharedVolume
Get-VMSwitch
```

## Procedure

1. Create the VM on an approved CSV.
2. Configure dynamic memory, vCPU, secure boot, and automatic actions.
3. Connect the production switch and assign the approved VLAN.
4. Add the VM as a clustered role.
5. Install from the approved template and enroll in monitoring and backup.

```powershell
$vm="PRD-APP-03"
$path="C:\ClusterStorage\CSV-Prod02\$vm"
New-VM -Name $vm -Generation 2 -MemoryStartupBytes 4GB -NewVHDPath "$path\$vm-OS.vhdx" -NewVHDSizeBytes 80GB -SwitchName "vSwitch-Production"
Set-VM -Name $vm -ProcessorCount 2 -AutomaticStartAction StartIfRunning -AutomaticStopAction ShutDown
Set-VMMemory -VMName $vm -DynamicMemoryEnabled $true -MinimumBytes 2GB -StartupBytes 4GB -MaximumBytes 8GB
Set-VMFirmware -VMName $vm -EnableSecureBoot On
Add-ClusterVirtualMachineRole -VMName $vm
```

## Validation

```powershell
Get-VM PRD-APP-03
Get-ClusterGroup PRD-APP-03
Get-VMIntegrationService PRD-APP-03
```

- Repeat the original workflow.
- Review logs and monitoring for new errors.
- Confirm storage, network, guest tools, and backup health.
- Obtain owner confirmation for production services.

## Rollback

Remove the cluster role and VM, then delete its unused VHDX only after confirming no production data exists.

## Escalation Criteria

Escalate if CSV capacity is below 15 percent, cluster health is degraded, or the VM cannot be clustered.

## Evidence to Retain

- Before-and-after command output
- Change or incident reference
- Capacity and health results
- Validation record
- Owner confirmation
