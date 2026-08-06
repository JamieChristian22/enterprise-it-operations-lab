# Patch Management

## Maintenance Standard

- Review security and package updates weekly.
- Apply routine updates during an approved maintenance window.
- Capture package lists before and after the change.
- Confirm whether a reboot is required.
- Validate critical services after patching.
- Retain a patch log.

## Procedure

```bash
sudo bash scripts/patch-server.sh
```

## Manual Validation

```bash
apt list --upgradable
systemctl --failed
systemctl is-active ssh
systemctl is-active cron
test -f /var/run/reboot-required && cat /var/run/reboot-required.pkgs
```

## Rollback Considerations

Package rollback may require an older package version, repository snapshot, VM snapshot, or application-level recovery. Never assume `apt` provides a complete operating-system rollback.
