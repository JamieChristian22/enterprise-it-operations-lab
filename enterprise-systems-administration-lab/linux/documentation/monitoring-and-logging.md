# Monitoring and Logging

## Health Indicators

| Indicator | Warning condition |
|---|---|
| Root filesystem | 80% utilization |
| Inodes | 80% utilization |
| Memory | Less than 10% available |
| Load | Sustained above CPU capacity |
| Failed services | Any failed unit |
| Authentication | Repeated failed logins |
| Backup | No successful archive in 24 hours |

## Commands

```bash
uptime
free -h
vmstat 1 5
df -hT
df -i
systemctl --failed
journalctl -p warning --since "-1 hour"
last -a | head
sudo lastb -a | head
```

## Journal Persistence

Set `Storage=persistent` in `/etc/systemd/journald.conf`, create `/var/log/journal`, and restart `systemd-journald` after validation.

## Log Review Principles

- Correlate timestamps across authentication, service, kernel, and application logs.
- Record timezone.
- Preserve evidence before deleting or rotating files.
- Separate symptoms from root cause.
