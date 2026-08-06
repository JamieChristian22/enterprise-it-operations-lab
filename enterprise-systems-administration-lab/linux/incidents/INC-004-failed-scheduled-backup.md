# INC-004 — Scheduled Backup Did Not Run

**Severity:** Medium

## Detection
No archive had been created during the previous 24 hours.

## Investigation
The cron log showed `command not found` because the script had been referenced with a relative path.

## Resolution
The cron definition was replaced with an absolute path and an explicit PATH. The backup was run manually.

## Validation
The archive checksum passed, archive contents were listed successfully, and a restore test completed.

## Prevention
Added backup-age checks to the health script and redirected cron output to a dedicated log.
