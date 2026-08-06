# Runbook: Low Disk Space

1. Confirm the affected volume and trend with `Get-Volume` and `Get-ChildItem`.
2. Identify top consumers using approved tools; do not delete unknown system files.
3. Clear approved temporary paths, expired IIS logs, and obsolete report exports.
4. Confirm VSS shadow storage is expected.
5. For file data, engage the data owner before removing or archiving content.
6. If projected utilization remains above 80%, expand the volume through change control.
7. Re-run the health report and verify at least 20% free space.

Rollback is not applicable to safe temporary cleanup; restore any business file removed in error from backup and document the event.
