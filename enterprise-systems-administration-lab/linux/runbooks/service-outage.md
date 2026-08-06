# Runbook: systemd Service Outage

## Procedure
1. Confirm impact and service name.
2. Run `systemctl status <service> --no-pager`.
3. Review `journalctl -u <service> --since "-30 minutes"`.
4. Validate configuration and dependencies.
5. Check ports, filesystems, permissions, memory, and disk.
6. Apply the least-risk correction.
7. Restart the service once.
8. Validate active state and application response.
9. Document the failure and prevention action.

## Escalation
Escalate after repeated crashes, suspected compromise, data corruption, or an unclear production dependency.
