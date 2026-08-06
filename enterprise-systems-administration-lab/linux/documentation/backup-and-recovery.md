# Backup and Recovery

## Scope

The scheduled backup includes:

- `/etc`
- `/srv/company-share`
- `/opt/northstar-api`

Archives are written to `/var/backups/northstar`, checksummed, and retained for 14 days.

## Create a Backup

```bash
sudo bash scripts/backup-directories.sh
```

## Restore Test

```bash
sudo bash tests/test-backup-restore.sh
```

The test:

1. Selects the newest archive.
2. Verifies its SHA-256 checksum.
3. Lists the archive to detect corruption.
4. Restores it to a temporary path.
5. Confirms expected directories are present.
6. Deletes the temporary restore path.

## Recovery Priority

1. Restore secure administrative access.
2. Restore service configuration.
3. Restore business data.
4. Validate permissions and ownership.
5. Start services.
6. Perform functional testing.
7. Document recovery time and data loss.
