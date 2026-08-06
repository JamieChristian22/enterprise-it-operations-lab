# ESXi Host Patching

| Field | Value |
|---|---|
| Change type | Normal |
| Risk | Medium |
| Asset | ESX01 |
| Owner | Jamie Christian |
| Status | Completed successfully |

## Prechecks
- Current backups confirmed
- Capacity and health confirmed
- No active P1 incident
- Owner notification completed

## Implementation
Enter maintenance, apply approved ESXi baseline, reboot, validate, and reconnect.

## Validation
Service, monitoring, storage, networking, and application smoke tests passed.

## Rollback
Boot the prior image profile or keep ESX01 in maintenance.
