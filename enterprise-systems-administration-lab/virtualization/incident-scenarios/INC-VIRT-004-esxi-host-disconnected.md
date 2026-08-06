# ESXi Host Disconnected

| Field | Value |
|---|---|
| Priority | P1 |
| Platform | VMware |
| Asset | ESX02 |
| Technician | Jamie Christian |
| Status | Resolved |
| SLA | Met |

## Business Impact
Production availability or administrative control was materially affected.

## Root Cause
An expired host certificate prevented the vCenter trust relationship.

## Resolution
Renewed the certificate, restarted management agents, and reconnected ESX02.

## Validation
Host connected, vMotion passed, datastores accessible.

## Preventive Action
Updated monitoring, operational documentation, and change-review controls to detect or prevent recurrence.
