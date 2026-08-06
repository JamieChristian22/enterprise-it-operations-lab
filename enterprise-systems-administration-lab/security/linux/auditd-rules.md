# auditd Rules

Monitor:

- Changes to identity files
- sudoers changes
- SSH configuration
- privileged command execution
- time changes
- kernel module changes

Example:

```text
-w /etc/passwd -p wa -k identity
-w /etc/group -p wa -k identity
-w /etc/sudoers -p wa -k sudoers
-w /etc/ssh/sshd_config -p wa -k ssh
```
