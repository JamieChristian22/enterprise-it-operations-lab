# Linux Security Hardening Baseline

## Identity and Access

- Disable direct root SSH login.
- Use individual administrator accounts.
- Enforce key-based SSH access.
- Grant sudo through groups and command aliases.
- Lock inactive or terminated accounts.
- Review privileged memberships quarterly.

## Network

- Default-deny inbound firewall policy.
- Permit SSH only from the administration subnet.
- Permit application ports only when required.
- Review listening services regularly.

## Host

- Apply security updates.
- Enable auditd.
- Remove or disable unused services.
- Protect sensitive files with restrictive permissions.
- Maintain accurate system time.
- Enable persistent logging.
- Monitor failed authentication attempts.

## Verification

```bash
sudo bash tests/test-security-controls.sh
sudo awk -F: '($2 == "") {print "Empty password:",$1}' /etc/shadow
sudo find / -xdev -type f -perm -0002 -print
sudo ss -tulpn
sudo ufw status verbose
```
