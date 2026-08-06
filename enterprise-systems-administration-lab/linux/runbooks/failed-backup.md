# Runbook: Failed Backup

1. Review `/var/log/northstar-backup.log`.
2. Confirm source and destination paths exist.
3. Check free space and inodes.
4. Verify root can read all backup sources.
5. Run the backup script manually.
6. Verify the checksum and archive listing.
7. Complete a restore test.
8. Confirm the next scheduled run.
9. Document the recovery point impact.
