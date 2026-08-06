# Enterprise Systems Administration Knowledge Base

A portfolio-ready operational knowledge base containing 40 complete runbooks for Active Directory, Windows Server, Linux, Microsoft 365, Microsoft Entra, Hyper-V, backup and recovery, monitoring, performance, and security operations.

## Environment

The documentation represents **Contoso Systems Administration Lab**, a controlled enterprise simulation with:

- Active Directory domain: `corp.contoso.com`
- Domain controllers: `DC01` and `DC02`
- File server: `FS01`
- Application server: `APP01`
- Backup repository: `BACKUPREPO01`
- Monitoring server: `MONITOR01`
- Microsoft 365 tenant domain: `contoso.com`
- Standard example user: `jcarter@contoso.com`

All names and records are fictional and safe for portfolio demonstration.

## Documentation quality controls

Every article includes ownership metadata, scope, symptoms, likely causes, prerequisites, diagnostic commands, decision points, validation, rollback, escalation, security notes, a completed ticket example, and an evidence checklist.

## Article index

- [KB-001 — Troubleshoot Active Directory Account Lockouts](kb-001-ad-account-lockouts.md) — Active Directory — Medium
- [KB-002 — Diagnose DNS Name Resolution Failures](kb-002-dns-resolution.md) — DNS / Networking — High
- [KB-003 — Troubleshoot Active Directory Replication](kb-003-ad-replication.md) — Active Directory — Critical
- [KB-004 — Troubleshoot Group Policy Processing](kb-004-group-policy-processing.md) — Group Policy — High
- [KB-005 — Validate and Recover FSMO Role Availability](kb-005-fsmo-roles.md) — Active Directory — Critical
- [KB-006 — Troubleshoot NTFS Permission Issues](kb-006-ntfs-permissions.md) — Windows File Services — High
- [KB-007 — Troubleshoot SMB Share Access](kb-007-smb-access.md) — Windows File Services — High
- [KB-008 — Recover Windows Print Spooler Failures](kb-008-print-spooler.md) — Windows Printing — Medium
- [KB-009 — Troubleshoot Windows Service Failures](kb-009-windows-service-failures.md) — Windows Server — High
- [KB-010 — Perform Structured Windows Event Log Analysis](kb-010-event-viewer-analysis.md) — Windows Server — Medium
- [KB-011 — Troubleshoot WSUS Client Reporting and Scan Failures](kb-011-wsus-client-failures.md) — Patch Management — High
- [KB-012 — Reset Windows Update Components Safely](kb-012-windows-update-reset.md) — Patch Management — High
- [KB-013 — Remediate Windows Disk Capacity Alerts](kb-013-disk-cleanup.md) — Windows Server — High
- [KB-014 — Expand a Windows Data Volume](kb-014-volume-expansion.md) — Storage — High
- [KB-015 — Troubleshoot Remote Desktop Connection Failures](kb-015-rdp-failures.md) — Remote Administration — High
- [KB-016 — Respond to TLS Certificate Expiration](kb-016-certificate-expiration.md) — PKI / Security — Critical
- [KB-017 — Troubleshoot Linux SSH Connection Failures](kb-017-linux-ssh-failures.md) — Linux — High
- [KB-018 — Troubleshoot systemd Service Failures](kb-018-systemd-services.md) — Linux — High
- [KB-019 — Remediate Linux Disk and Inode Pressure](kb-019-linux-disk-pressure.md) — Linux — High
- [KB-020 — Troubleshoot and Grant Linux sudo Access](kb-020-sudo-access.md) — Linux / Security — High
- [KB-021 — Troubleshoot Linux Package Update Failures](kb-021-package-update-failures.md) — Linux / Patch Management — High
- [KB-022 — Troubleshoot Linux cron Job Failures](kb-022-cron-jobs.md) — Linux — Medium
- [KB-023 — Correct Linux and Windows Time Drift](kb-023-ntp-drift.md) — Time Services — Critical
- [KB-024 — Resolve Microsoft 365 Licensing Issues](kb-024-microsoft-365-licensing.md) — Microsoft 365 — High
- [KB-025 — Configure and Troubleshoot Shared Mailboxes](kb-025-shared-mailboxes.md) — Microsoft 365 / Exchange Online — High
- [KB-026 — Troubleshoot Exchange Online Mail Flow](kb-026-exchange-mail-flow.md) — Microsoft 365 / Exchange Online — Critical
- [KB-027 — Troubleshoot Microsoft Teams Sign-In](kb-027-teams-sign-in.md) — Microsoft 365 / Teams — High
- [KB-028 — Troubleshoot OneDrive Synchronization](kb-028-onedrive-sync.md) — Microsoft 365 / OneDrive — High
- [KB-029 — Reset Microsoft Entra MFA Methods Safely](kb-029-mfa-reset.md) — Identity / Microsoft Entra — High
- [KB-030 — Troubleshoot Microsoft Entra Conditional Access](kb-030-conditional-access.md) — Identity / Microsoft Entra — Critical
- [KB-031 — Troubleshoot Hyper-V Virtual Machine Startup](kb-031-hyper-v-vm-startup.md) — Virtualization — High
- [KB-032 — Manage and Consolidate Hyper-V Checkpoints](kb-032-vm-snapshot-cleanup.md) — Virtualization — High
- [KB-033 — Diagnose Virtual Machine Resource Pressure](kb-033-vm-resource-pressure.md) — Virtualization / Performance — High
- [KB-034 — Troubleshoot Enterprise Backup Job Failures](kb-034-backup-job-failure.md) — Backup and Recovery — Critical
- [KB-035 — Validate a Backup Restore](kb-035-restore-validation.md) — Backup and Recovery — Critical
- [KB-036 — Troubleshoot Monitoring Agent Failures](kb-036-monitoring-agent-failure.md) — Monitoring — High
- [KB-037 — Investigate Sustained High CPU Utilization](kb-037-high-cpu.md) — Performance — High
- [KB-038 — Investigate Sustained High Memory Utilization](kb-038-high-memory.md) — Performance — High
- [KB-039 — Execute and Validate Vulnerability Remediation](kb-039-vulnerability-remediation.md) — Security Operations — Critical
- [KB-040 — Perform a Privileged Access Review](kb-040-privileged-access-review.md) — Identity Governance — Critical

## How to use this repository

1. Start with the symptom and verify business impact.
2. Follow the least-disruptive diagnostic path.
3. Preserve evidence before making changes.
4. Apply only the correction supported by the evidence.
5. Complete all validation and ticket-closure requirements.

## Portfolio skills demonstrated

Active Directory, DNS, Group Policy, PowerShell, Windows Server, Linux, systemd, SSH, Microsoft 365, Exchange Online, Microsoft Entra ID, Conditional Access, Hyper-V, backup recovery, monitoring, vulnerability remediation, privileged-access governance, incident documentation, change control, and operational validation.
