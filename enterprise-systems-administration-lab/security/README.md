# Enterprise Security Hardening and Privileged Access Lab

A production-style security administration portfolio project demonstrating Windows and Linux hardening, Microsoft Defender, Windows Firewall, advanced audit policy, PowerShell logging, Windows LAPS, SMB hardening, SSH and sudo controls, auditd, privileged access governance, incident response, reporting, automation, and validation.

## Business Scenario

Northstar Services operates a mixed Windows and Linux environment supporting Active Directory, Microsoft 365, file services, internal applications, monitoring, patching, and PKI. The infrastructure team is responsible for reducing attack surface, protecting privileged access, validating security controls, and documenting operational evidence.

## Environment

| Component | Example |
|---|---|
| Active Directory domain | `northstar.local` |
| Windows Server | Domain controller, file server, application server |
| Windows clients | Windows 11 Enterprise |
| Linux servers | Ubuntu and Rocky Linux |
| Endpoint security | Microsoft Defender Antivirus |
| Local admin control | Windows LAPS |
| Linux privileged access | sudo groups and command restrictions |
| Audit | Windows Advanced Audit Policy, PowerShell logging, auditd |
| Firewall | Windows Defender Firewall, UFW/firewalld |
| Monitoring | Event logs, Sysmon, Prometheus/Grafana |

## Demonstrated Skills

- Apply Windows and Linux security baselines.
- Validate Defender, firewall, auditing, SMB, PowerShell, and LAPS settings.
- Harden SSH and sudo.
- Configure auditd and file-permission reviews.
- Review privileged groups and local administrators.
- Manage emergency access accounts.
- Detect and respond to suspicious administrative activity.
- Produce privileged-access and baseline-compliance reports.
- Automate security validation with PowerShell and Bash.
- Test scripts and configuration in CI.

## Repository Structure

```text
enterprise-security-hardening-lab/
├── README.md
├── architecture/
├── bash/
├── configuration/
├── documentation/
├── evidence/
├── incidents/
├── linux/
├── powershell/
├── privileged-access/
├── reports/
├── runbooks/
├── tests/
└── windows/
```

## Safe Lab Usage

Use in an isolated lab or authorized enterprise environment. Review every baseline and test with pilot systems before deployment. Security hardening can disrupt legacy applications if controls are applied without validation.

## Recommended Demonstration Flow

1. Review the security architecture.
2. Apply Windows controls to a pilot workstation and server.
3. Apply Linux controls to a lab server.
4. Run PowerShell and Bash validation.
5. Review privileged-access reports.
6. Simulate one incident and follow the matching runbook.
7. Save redacted validation output in `evidence/`.
