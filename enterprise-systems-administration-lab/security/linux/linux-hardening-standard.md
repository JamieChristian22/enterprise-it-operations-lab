# Linux Hardening Standard

## Core Controls

- Disable direct root SSH login
- Use key-based authentication
- Restrict SSH groups
- Apply least-privilege sudo
- Enable host firewall
- Enable auditd
- Remove unused services
- Protect sensitive files
- Review world-writable files
- Apply security updates
- Enable persistent logging
- Review failed authentication attempts

## Validation

```bash
sshd -T
sudo -l
systemctl is-active auditd
ufw status verbose
ss -tulpn
```
