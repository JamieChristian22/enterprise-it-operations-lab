# KB-013: Remediate Windows Disk Capacity Alerts

| Field | Value |
|---|---|
| Service | Windows Server |
| Audience | Service Desk / Systems Administrators |
| Severity | High |
| Owner | Infrastructure Operations |
| Author | Jamie Christian |
| Environment | Contoso Systems Administration Lab |
| Version | 1.0 |
| Last reviewed | August 6, 2026 |
| Review cycle | Every 180 days |

## Purpose

Provide a repeatable, auditable procedure to diagnose and resolve remediate windows disk capacity alerts in the Contoso Systems Administration Lab.

## Scope

This runbook applies to managed Windows Server, Linux, Microsoft 365, Microsoft Entra, Hyper-V, backup, monitoring, and identity services in the lab environment. It is designed for incident response and routine operational support. It does not authorize bypassing security controls or making unapproved production changes.

## Symptoms

- System drive exceeds 85% utilization
- Applications fail writing logs or temporary files
- Updates or backups fail for insufficient space


## Likely causes

- Oversized logs or dumps
- Stale profiles and temporary files
- Component store or application data growth


## Prerequisites and safety checks

- Approved support ticket with affected user, system, timestamps, and business impact
- Administrative access appropriate to the platform; use a separate privileged account
- A current backup or rollback path before changing production configuration
- Change approval for service restarts, policy changes, access changes, or reboots


## Diagnostic and resolution procedure

### Step 1: Collect the current state

Run:

```text
Get-Volume
```

Record the command output, timestamp, server or user context, and any error code. Do not make a broader change until the result supports it.
### Step 2: Test the most likely dependency

Run:

```text
Get-ChildItem C:\ -Force -ErrorAction SilentlyContinue | Sort Length -Descending | Select -First 20
```

Record the command output, timestamp, server or user context, and any error code. Do not make a broader change until the result supports it.
### Step 3: Inspect logs and configuration

Run:

```text
DISM /Online /Cleanup-Image /StartComponentCleanup
```

Record the command output, timestamp, server or user context, and any error code. Do not make a broader change until the result supports it.
### Step 4: Apply the least-disruptive correction

Run:

```text
cleanmgr /verylowdisk
```

Record the command output, timestamp, server or user context, and any error code. Do not make a broader change until the result supports it.
### Step 5: Apply the corrective action

Correct only the verified cause. Prefer reversible changes, preserve existing configuration, and document the previous value before modification.

## Decision points

1. **The issue cannot be reproduced:** confirm the incident time, device, user, network, and error message; then review historical logs.
2. **The first dependency test fails:** resolve connectivity, name resolution, authentication, storage, or service availability before changing the application.
3. **A change affects multiple users or systems:** stop and use formal change control.
4. **Evidence indicates compromise or unauthorized access:** preserve logs and escalate immediately to Security Operations.
5. **A restart or reboot is required:** confirm the maintenance window and business-owner approval.

## Validation

- Free space exceeds the operational threshold
- Critical services function normally
- A monitoring recovery event is recorded


## Rollback

- Restore the recorded previous setting, permission, service account, policy assignment, binding, package, or configuration file.
- Restart only the affected component when necessary.
- Re-run the validation checks and document whether rollback restored service.
- Use the approved backup or recovery procedure if the change caused data or service corruption.

## Escalation criteria

Escalate to the platform owner when any of the following applies:

- The issue affects more than five users, a domain controller, a production server, or a critical business service.
- The same failure returns after one verified correction.
- Data loss, suspected compromise, certificate/private-key exposure, or privileged-access abuse is possible.
- Required access, vendor support, outage approval, or maintenance-window authority is unavailable.
- Recovery threatens the documented RPO or RTO.

## Security and compliance notes

- Use least privilege and never share administrative credentials.
- Redact tokens, passwords, private keys, message contents, and personal data from screenshots and tickets.
- Preserve relevant logs before clearing caches, restarting services, or removing records.
- Document all access and configuration changes with the ticket or change number.

## Ticket documentation example

```text
INC-260813 — Remediate Windows Disk Capacity Alerts

Impact: One business service or user workflow was degraded.
Evidence: Symptoms reproduced and command output attached.
Cause: Oversized logs or dumps.
Resolution: Corrected the verified configuration or service condition and repeated the validation checks.
Validation: Free space exceeds the operational threshold; Critical services function normally.
Closure: User or service owner confirmed normal operation. No sensitive data was placed in the ticket.
```

## Evidence checklist

- [ ] Initial symptom and exact error captured
- [ ] Relevant command output or log events attached
- [ ] Root cause supported by evidence
- [ ] Corrective action and previous value documented
- [ ] Validation completed from the user or service perspective
- [ ] Monitoring confirmed healthy
- [ ] User or service owner notified

## Related knowledge

- Use the repository `README.md` for the complete article index.
- Follow `DOCUMENTATION-STANDARD.md` for evidence, change, naming, and review requirements.
- Use `ARTICLE-TEMPLATE.md` when creating new runbooks.
