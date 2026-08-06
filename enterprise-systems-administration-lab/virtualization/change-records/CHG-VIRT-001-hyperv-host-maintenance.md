# Hyper-V Host Maintenance

| Field | Value |
|---|---|
| Change type | Normal |
| Risk | Medium |
| Asset | HV01 |
| Owner | Jamie Christian |
| Status | Completed successfully |

## Prechecks
- Current backups confirmed
- Capacity and health confirmed
- No active P1 incident
- Owner notification completed

## Implementation
Drain roles, apply Windows and NIC updates, reboot, validate, and resume.

## Validation
Service, monitoring, storage, networking, and application smoke tests passed.

## Rollback
Keep HV01 paused and remove the failed update or driver.
