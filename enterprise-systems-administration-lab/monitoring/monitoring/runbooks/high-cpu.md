# Runbook: High CPU Utilization

## Trigger
CPU utilization exceeds 90% for 10 minutes.

## Response
1. Confirm the alert and affected host.
2. Review the CPU dashboard and compare with baseline.
3. Identify top processes.
4. Check recent deployments, scheduled jobs, backups, and antivirus scans.
5. Review load average, process state, and disk wait.
6. Stop or restart only the confirmed offending workload.
7. Validate CPU returns to baseline.
8. Record cause, action, and prevention step.

## Linux Commands
```bash
uptime
top
ps aux --sort=-%cpu | head
pidstat 1 5
journalctl --since "-30 minutes"
```

## Windows Commands
```powershell
Get-Process | Sort-Object CPU -Descending | Select-Object -First 10
Get-Counter '\Processor(_Total)\% Processor Time'
```
