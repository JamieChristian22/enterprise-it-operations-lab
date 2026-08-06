# Virtualization Environment Overview

Northstar Services Group operates a mixed Hyper-V and VMware platform supporting identity, finance, file services, line-of-business applications, monitoring, backup, development, and testing.

| Platform | Management | Compute | Storage | Availability |
|---|---|---|---|---|
| Hyper-V | Windows Admin Center and PowerShell | HV01, HV02 | CSV-Prod01, CSV-Prod02 | Failover Clustering |
| VMware | VCENTER01 and PowerCLI | ESX01, ESX02, ESX03 | DS-PROD-01, DS-PROD-02 | HA and DRS |

## Operating Principles
- Checkpoints and snapshots are temporary and never replace backups.
- Production changes require prechecks, validation, and rollback.
- Hosts enter maintenance mode before patching.
- Management, migration, production, and backup traffic remain separated.
- Critical recovery is tested and documented.
