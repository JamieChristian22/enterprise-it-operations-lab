# Enterprise Linux Systems Administration Lab

A production-style Linux administration portfolio project demonstrating user lifecycle management, privileged access, SSH hardening, service operations, storage monitoring, patching, backup and recovery, logging, firewall management, incident response, and Bash automation.

## Business Scenario

Northstar Services operates an internal Ubuntu Server 24.04 LTS host named `nss-linux-01`. The server provides a controlled shared workspace, scheduled backup services, centralized administrative access, and a small internal application service. The systems administrator is responsible for keeping the host secure, available, recoverable, and auditable.

## Environment

| Component | Configuration |
|---|---|
| Hostname | `nss-linux-01` |
| Operating system | Ubuntu Server 24.04 LTS |
| Network | `10.20.30.0/24` |
| Server IP | `10.20.30.15` |
| Default gateway | `10.20.30.1` |
| DNS | `10.20.30.10`, `1.1.1.1` |
| Administrative group | `linux-admins` |
| Support group | `helpdesk-linux` |
| Shared data path | `/srv/company-share` |
| Backup destination | `/var/backups/northstar` |
| Managed service | `northstar-api.service` |

## Portfolio Outcomes

This project demonstrates the ability to:

- Provision, modify, lock, and remove Linux accounts safely.
- Apply least-privilege sudo access through a dedicated policy file.
- Configure secure key-based SSH administration.
- Use `systemctl` and `journalctl` to operate and troubleshoot services.
- Monitor CPU, memory, disk, inode, process, and service health.
- Configure firewall rules with UFW.
- Schedule backups and operational checks.
- Perform and document a successful restore test.
- Analyze failed authentication attempts and security events.
- Patch systems with logging and verification.
- Investigate realistic incidents and write clear resolution records.
- Validate controls with repeatable test scripts.

## Repository Structure

```text
linux/
├── README.md
├── architecture/
├── configuration/
├── documentation/
├── evidence/
├── incidents/
├── runbooks/
├── scripts/
└── tests/
```

## Safe Lab Usage

Run the scripts only in a disposable Ubuntu lab VM. Review each script before using it. Most administrative scripts require root privileges.

```bash
sudo bash scripts/server-health-check.sh
sudo bash tests/test-security-controls.sh
```

## Suggested Demonstration Sequence

1. Build the server using `documentation/server-build-guide.md`.
2. Configure access using `documentation/user-access-management.md`.
3. Apply SSH, firewall, and sudo configuration.
4. Install the sample systemd unit.
5. Run the health check and validation scripts.
6. Execute a backup and restore test.
7. Review the documented incidents and runbooks.
8. Save command output in `evidence/`.

## Recruiter Summary

This is not a collection of disconnected Linux commands. It is an operational package showing how a junior systems administrator would build, secure, automate, validate, troubleshoot, and recover a business Linux server.
