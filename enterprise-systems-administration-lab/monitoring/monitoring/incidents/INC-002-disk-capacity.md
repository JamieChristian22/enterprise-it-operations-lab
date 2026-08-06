# INC-002 — Database Server Disk Capacity Alert

**Severity:** High  
**Alert:** LinuxDiskSpaceLow

## Cause
Backup archives were retained for 90 days instead of the approved 14 days.

## Resolution
Expired backups were removed after verification, and retention automation was corrected.

## Validation
Free space increased from 8% to 42%, and the backup job completed.

## Prevention
Added backup-directory growth to the capacity report.
