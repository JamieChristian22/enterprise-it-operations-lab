# Weekly Infrastructure Health Report

## Summary

- 22 of 22 monitored infrastructure targets are available.
- No failed Linux systemd units remain open.
- One Windows service alert was resolved.
- Root filesystem utilization is below 80% on all servers.
- Database storage growth requires continued monitoring.

## Server Health

| Server | OS | CPU Avg | Memory Available | Disk Free | Status |
|---|---|---:|---:|---:|---|
| NSS-LINUX-APP01 | Ubuntu | 18% | 62% | 48% | Healthy |
| NSS-LINUX-DB01 | Rocky Linux | 32% | 44% | 22% | Watch |
| NSS-WIN-FILE01 | Windows Server | 21% | 51% | 39% | Healthy |
| NSS-DC01 | Windows Server | 12% | 68% | 57% | Healthy |
