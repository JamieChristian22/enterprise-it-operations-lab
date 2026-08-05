# GPO Backup and Restore Runbook

1. Create a dated backup directory.
2. Run `Backup-GPO -All`.
3. Export GPO inventory and links.
4. Verify backup metadata.
5. Retain backups for 90 days.
6. For rollback, use `Restore-GPO` and validate with `gpresult`.
