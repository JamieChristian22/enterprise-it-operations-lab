# CHG-2026-042 — Expand File Server Data Volume

- Type: Normal
- Risk: Moderate (3 × 2 = 6)
- Status: Successful
- Window: August 4, 2026, 10:00–10:45 PM ET

## Objective
Expand `FS01` data volume from 2.0 TB to 2.5 TB after utilization reached 82%.

## Implementation
Confirmed backup success, created hypervisor snapshot, expanded virtual disk by 500 GB, rescanned disks, extended NTFS volume, and validated shares.

## Validation
Free space increased to 846 GB. SMB share tests, permissions, shadow copies, and backup discovery passed.

## Rollback
Restore VM snapshot and revert virtual disk configuration.

## Outcome
Successful with no user-visible interruption.
