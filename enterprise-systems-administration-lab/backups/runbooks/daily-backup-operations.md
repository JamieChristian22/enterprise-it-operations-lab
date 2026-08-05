# Daily Backup Operations Runbook

1. Open the prior 24-hour job summary.
2. Confirm every protected asset has a successful recovery point within its RPO.
3. Review failed, warning, canceled, or unusually short jobs.
4. Verify primary repository free space remains above 20%.
5. Confirm the offline copy completed and the vault is disconnected.
6. Confirm offsite replication completed within 24 hours.
7. Run `Get-BackupHealthReport.ps1` and archive the output.
8. Open an incident for each unresolved failure.
9. Record the daily review in the operations log.

## Completion Criteria
No critical failures, no expired RPOs, no checksum errors, and sufficient repository capacity.
