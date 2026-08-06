# Production VM Memory Expansion

| Field | Value |
|---|---|
| Change type | Normal |
| Risk | Medium |
| Asset | PRD-APP-04 |
| Owner | Jamie Christian |
| Status | Completed successfully |

## Prechecks
- Current backups confirmed
- Capacity and health confirmed
- No active P1 incident
- Owner notification completed

## Implementation
Increase memory from 4 GB to 8 GB after sustained pressure was confirmed.

## Validation
Service, monitoring, storage, networking, and application smoke tests passed.

## Rollback
Return memory to 4 GB if regression occurs.
