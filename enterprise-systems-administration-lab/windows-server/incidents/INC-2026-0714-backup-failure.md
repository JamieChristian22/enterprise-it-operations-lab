# INC-2026-0714 — File Server Backup Failure

- **Priority:** P2
- **Opened:** July 14, 2026, 08:12 ET
- **Resolved:** July 14, 2026, 09:03 ET
- **Affected service:** NSS-FILE01 backup
- **Owner:** Jamie Christian

## Impact

The scheduled backup failed and the latest valid recovery point was 32 hours old. File service remained available, but recovery-point objectives were at risk.

## Timeline

- 08:12 — Daily check detected backup age above 26-hour threshold.
- 08:18 — Event 517 identified insufficient target free space.
- 08:26 — Confirmed backup volume was 94% utilized by expired lab recovery points.
- 08:34 — Removed recovery points older than the approved 14-day retention period.
- 08:39 — Backup target returned to 31% free space.
- 08:42 — Started manual backup.
- 08:58 — Backup completed successfully.
- 09:03 — Freshness validation passed and incident closed.

## Root Cause

Retention cleanup was not included in the original scheduled maintenance task, allowing obsolete recovery points to consume the backup target.

## Resolution

Reclaimed approved expired recovery points, completed a successful manual backup, and added a weekly capacity alert at 80% utilization.

## Prevention

Added backup-volume utilization to the daily health report and established a documented retention review.
