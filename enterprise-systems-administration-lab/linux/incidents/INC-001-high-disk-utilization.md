# INC-001 — Root Filesystem at 94%

**Severity:** High  
**Service impact:** Backups failed and the internal API could not write temporary files.

## Detection
The health check returned `WARNING: / is 94% full`.

## Investigation
`du -xhd1 /var` identified `/var/log` as the largest path. A disabled application logrotate rule allowed `northstar-api.log` to grow to 18 GB.

## Resolution
The log was copied for investigation, the service was stopped, the oversized log was truncated safely, the supplied logrotate rule was installed, and log rotation was tested with `logrotate -d`.

## Validation
Root utilization fell to 41%, the API started successfully, and a backup completed.

## Prevention
Added daily disk checks and a 14-day compressed rotation policy.
