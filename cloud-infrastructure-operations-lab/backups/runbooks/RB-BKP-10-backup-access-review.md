# Quarterly Backup Access Review

1. Export AWS IAM roles, vault access policies, KMS key policies, Azure RBAC assignments, and vault security settings.
2. Compare assignments with approved roles: `BackupAdministrator`, `BackupRestoreOperator`, `BackupAuditor`, and emergency access.
3. Remove dormant, duplicate, inherited, or excessive permissions through approved changes.
4. Confirm backup administrators cannot disable logging, delete keys, or bypass independent approval for protected vaults.
5. Review emergency-access use, denied actions, deletion attempts, and policy changes.
6. Record reviewer, evidence sources, findings, corrective actions, owners, and completion dates.
