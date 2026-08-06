# Windows Server Administration Guide

## 1. Purpose

This guide defines the day-to-day administration standard for the Northstar Services Windows Server 2022 lab. It is written so another administrator can operate the environment without relying on undocumented knowledge.

## 2. Administrative Access

1. Use a named administrative account separate from the standard user account.
2. Connect only from the management subnet `10.20.30.0/24`.
3. Use PowerShell remoting for repeatable work and RDP only when a graphical tool is necessary.
4. Record changes affecting availability, security, permissions, backup, or installed roles.
5. Never store credentials in scripts, repositories, tickets, or command history.

## 3. Daily Checklist

- Confirm all four servers respond to ICMP and PowerShell remoting.
- Review critical and error events generated during the previous 24 hours.
- Confirm required services are running.
- Check system and data volumes for less than 20% free space.
- Confirm the latest backup is no older than 26 hours.
- Review failed scheduled tasks and print queue errors.
- Record exceptions in the operations log.

Command:

```powershell
.\powershell\Get-ServerHealth.ps1 `
  -ComputerName NSS-DC01,NSS-FILE01,NSS-PRINT01,NSS-APP01 `
  -Hours 24 -OutputPath .\reports\generated
```

## 4. Weekly Checklist

- Review disabled, stale, or unauthorized local administrator accounts.
- Verify Windows Firewall profiles remain enabled.
- Confirm SMBv1 is not installed.
- Review share and NTFS permission drift.
- Review backup storage utilization.
- Validate certificate expiration is greater than 60 days.
- Review pending updates and planned maintenance.

## 5. Monthly Checklist

- Apply approved Windows updates during the maintenance window.
- Capture pre-change health and backup status.
- Reboot systems in the sequence: application, print, file, domain controller last unless update dependencies require otherwise.
- Run post-change validation and Pester tests.
- Review capacity trends and event-log recurring patterns.
- Test restoration of one randomly selected file.

## 6. Server Onboarding

1. Create the VM with the approved CPU, memory, and disk allocation.
2. Install Windows Server 2022 Desktop Experience.
3. Rename the server according to `NSS-<ROLE><NN>`.
4. Configure the static IP, gateway, and DNS.
5. Install all approved updates.
6. Join `northstar.local`.
7. Add the server to the correct AD organizational unit.
8. Install required roles from `configuration/server-role-matrix.csv`.
9. Apply baseline controls from `configuration/security-baseline.md`.
10. Enable PowerShell remoting and limit WinRM/RDP access to the management subnet.
11. Run the baseline validation script.
12. Save evidence and update the server inventory.

## 7. Role and Feature Management

Use `Get-WindowsFeature` before and after installation. Install only documented roles. Example:

```powershell
Get-WindowsFeature FS-FileServer,FS-Resource-Manager,Windows-Server-Backup
Install-WindowsFeature FS-FileServer,FS-Resource-Manager,Windows-Server-Backup -IncludeManagementTools
```

Document the change, validation, and rollback method before installation.

## 8. File Share Administration

- Create data under `D:\Shares`.
- Use access-based enumeration.
- Disable offline caching unless approved.
- Grant broad share permissions only when NTFS provides the restrictive control.
- Assign permissions to domain groups, never directly to individual users.
- Use naming pattern `GG_<Department>_<Access>`.

Example access model:

| Group | Share permission | NTFS permission |
|---|---|---|
| `GG_Finance_RW` | Change | Modify |
| `GG_Finance_RO` | Read | Read and Execute |
| `Domain Admins` | Full Control | Full Control |

## 9. Backup and Restore

- Daily backup starts at 22:00.
- Protect file data and system-state-relevant volumes.
- Backup destination is the dedicated `E:` volume in this lab.
- Do not store the only recovery copy on the protected data volume.
- Validate backup freshness daily and perform a restore test quarterly.

Restore process:

1. Confirm the requested path, owner, deletion time, and target restore location.
2. Identify a recovery point before the loss.
3. Restore to an alternate path first.
4. Validate file size, hash, ownership, and access.
5. Return the file to production after user confirmation.
6. Record recovery point, duration, and result.

## 10. Patch Management

- Maintenance window: third Saturday, 22:00–01:00 Eastern.
- Pre-checks: service state, disk free space, backup freshness, pending reboot, health report.
- Apply approved cumulative and security updates.
- Reboot, validate services, shares, DNS, printing, and application endpoint.
- Roll back only after identifying a clear update-related failure and obtaining change approval.

## 11. Event and Service Troubleshooting

1. Define the user-visible symptom and affected scope.
2. Check service state and dependencies.
3. Review System and Application events for the relevant time window.
4. Verify network reachability, DNS, storage, and credentials.
5. Apply the least disruptive corrective action.
6. Confirm recovery from both the server and client perspective.
7. Capture commands, event IDs, and final status in the incident record.

## 12. Certificate Management

- Track subject, thumbprint, issuer, intended purpose, and expiration.
- Alert at 60 days and escalate at 30 days.
- Never remove the old certificate until the new binding is verified.
- Validate IIS bindings and client trust after replacement.

## 13. Scheduled Tasks

Scheduled tasks must use a managed service account or approved service identity, run with least privilege, log output, and use nonzero exit codes on failure. Review task history and last result weekly.

## 14. Decommissioning

1. Confirm application and data owners approve retirement.
2. Capture final backup and configuration inventory.
3. Remove scheduled tasks, DNS records, SPNs, shares, and monitoring entries.
4. Disable the computer account for seven days before deletion.
5. Sanitize or destroy data disks according to policy.
6. Update inventory and close the change record.
