# Runbook: Failed Windows Server Backup

## Trigger

Backup status is failed, no new recovery point exists within 26 hours, or event IDs 5, 9, 49, 517, or 521 indicate backup problems.

## Procedure

1. Confirm scope and latest backup:
   ```powershell
   Get-WBJob -Previous 1
   Get-WBBackupSet | Sort-Object BackupTime -Descending | Select-Object -First 3
   ```
2. Check backup target free space and health.
3. Review `Microsoft-Windows-Backup/Operational` and System logs.
4. Confirm VSS writers are stable:
   ```powershell
   vssadmin list writers
   ```
5. If a writer is failed, restart its owning service only when business impact is understood.
6. Remove obsolete backup versions only under the retention policy.
7. Start a manual backup and monitor completion.
8. Run `Test-BackupFreshness.ps1`.

## Validation

A new successful recovery point exists, VSS writers report stable/no error, and the backup target has at least 20% free space.

## Escalation

Escalate immediately when the target disk shows filesystem errors, multiple consecutive backups fail, or no valid recovery point exists.
