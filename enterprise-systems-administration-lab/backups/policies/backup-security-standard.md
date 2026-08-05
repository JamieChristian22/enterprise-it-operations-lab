# Backup Security Standard

- Service account `CORP\svc_backup` is non-interactive and denied local logon.
- Repository permissions grant Modify only to the backup service and backup operators group.
- BitLocker protects local backup volumes.
- TLS protects offsite transfer.
- MFA is required for cloud vault administrators.
- Soft delete and purge protection are enabled for the recovery vault.
- Backup credentials are stored in an approved secret vault, never in scripts.
- Offline media is disconnected outside the daily copy window.
- Backup logs are retained for 365 days.
- Quarterly access reviews validate backup administrator membership.
