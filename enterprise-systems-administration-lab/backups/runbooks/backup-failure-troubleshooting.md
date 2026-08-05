# Backup Failure Troubleshooting

| Symptom | Diagnostic Checks | Resolution |
|---|---|---|
| VSS snapshot failure | `vssadmin list writers`, event logs, free space | Restart failed writer service, clear stale snapshots, rerun job |
| Access denied | Service-account status, share/NTFS ACLs, credential age | Restore least-privilege access and rotate credential if required |
| Repository full | Capacity report, retention jobs, unexpected growth | Extend storage or remove only expired points through policy |
| Offsite copy timeout | Network path, DNS, firewall, vault status | Restore connectivity and resume replication |
| Checksum mismatch | Source hash, repository health, storage logs | Quarantine backup, run storage diagnostics, create new full backup |
| Job duration spike | Change rate, bottleneck, antivirus scan, network | Reschedule conflicting workload or tune exclusions safely |
