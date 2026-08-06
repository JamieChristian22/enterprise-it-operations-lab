# File Permission Audit

Review:

- World-writable files
- SUID/SGID binaries
- Sensitive configuration ownership
- Unauthorized SSH keys
- Writable service files
- Home-directory permissions

Commands:

```bash
find / -xdev -type f -perm -0002
find / -xdev -type f \( -perm -4000 -o -perm -2000 \)
stat /etc/shadow /etc/sudoers /etc/ssh/sshd_config
```
