# Runbook: High Disk Usage

## Trigger
A filesystem reaches 80% utilization or an application reports write failures.

## Procedure
1. Confirm the affected filesystem with `df -hT` and inode usage with `df -i`.
2. Find growth with `du -xhd1 <mount> | sort -h`.
3. Check deleted-open files using `sudo lsof +L1`.
4. Review journal size using `journalctl --disk-usage`.
5. Review backup and application retention.
6. Free space only through an approved action.
7. Validate the affected service and backup job.
8. Record the root cause, amount recovered, and prevention action.

## Do Not
Do not delete unknown files from `/var/lib`, active databases, or application directories.
