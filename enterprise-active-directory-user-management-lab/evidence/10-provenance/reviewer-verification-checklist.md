# Reviewer Verification Checklist

- [ ] Confirm domain name and hostnames match the technical summary.
- [ ] Compare live user count to the inventory summary.
- [ ] Confirm department Global groups exist.
- [ ] Confirm resource permissions are assigned to Domain Local groups.
- [ ] Review `dcdiag-live.txt` for critical failures.
- [ ] Review `repadmin-replsummary-live.txt` for replication failures.
- [ ] Confirm GPO names and links in `gpo-report-all.html`.
- [ ] Confirm Help Desk groups do not hold privileged administrative roles.
- [ ] Review live NTFS exports for direct user ACEs and excessive permissions.
- [ ] Confirm event logs contain account-management audit events.
- [ ] Recalculate one SHA-256 hash and compare it with the manifest.
