# Live Migration Failed

| Field | Value |
|---|---|
| Priority | P1 |
| Platform | Hyper-V |
| Asset | HV01 to HV02 |
| Technician | Jamie Christian |
| Status | Resolved |
| SLA | Met |

## Business Impact
Production availability or administrative control was materially affected.

## Root Cause
HV02 Live Migration NIC was placed in the wrong VLAN after switch work.

## Resolution
Corrected the VLAN and repeated Move-ClusterVirtualMachineRole.

## Validation
VM stayed online and cluster logs recorded success.

## Preventive Action
Updated monitoring, operational documentation, and change-review controls to detect or prevent recurrence.
