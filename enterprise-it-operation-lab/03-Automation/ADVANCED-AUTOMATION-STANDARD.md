# Advanced Automation Standard

Scripts 21 through 35 add enterprise-grade operational depth. They use approved parameters, explicit error handling, structured objects, exportable evidence, remote collection, WhatIf support for state-changing actions, and predictable report locations.

## Required Review

Before production use, an administrator reviews permissions, module availability, remoting configuration, target names, retention settings, and rollback steps. State-changing scripts are first executed with `-WhatIf`. Credentials are never stored in source code. Scheduled tasks run through a dedicated gMSA when supported.

## Logging and Evidence

Automation writes CSV or JSON reports to the Reports directory. Daily health data is retained 365 days; operational logs are retained 90 days. Failed collections remain visible instead of being silently omitted.

## Script Catalog

| ID | Script | Operational purpose |
|---:|---|---|
| 21 | Initialize-CTSAutomation | Creates controlled folders and configuration |
| 22 | Test-ADHealth | Checks DC services and replication failures |
| 23 | Backup-GroupPolicy | Creates versioned GPO backups and enforces retention |
| 24 | Get-DHCPUtilization | Detects exhausted DHCP scopes |
| 25 | Test-DNSInfrastructure | Tests required records against both DNS servers |
| 26 | Get-CriticalServiceHealth | Checks role-specific services |
| 27 | Get-PrivilegedGroupChanges | Collects security events for group changes |
| 28 | Get-AccountLockoutEvidence | Correlates lockout state with Event ID 4740 |
| 29 | Get-PatchCompliance | Compares latest hotfix date against policy |
| 30 | Test-BackupFreshness | Verifies current recovery points |
| 31 | Get-LocalAdministratorsAudit | Audits endpoint local admin membership |
| 32 | Get-BitLockerCompliance | Collects encryption and protection state |
| 33 | Invoke-WorkstationHealthCheck | Captures disk, reboot, uptime, and Defender health |
| 34 | New-CTSFileShare | Implements AGDLP groups, NTFS, and SMB permissions |
| 35 | Get-EnterpriseDailyHealth | Orchestrates daily infrastructure checks |
