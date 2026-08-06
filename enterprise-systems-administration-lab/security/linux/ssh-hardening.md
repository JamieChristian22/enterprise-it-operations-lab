# SSH Hardening

Recommended settings:

```text
PermitRootLogin no
PasswordAuthentication no
PubkeyAuthentication yes
PermitEmptyPasswords no
MaxAuthTries 3
LoginGraceTime 30
ClientAliveInterval 300
ClientAliveCountMax 2
AllowGroups linux-admins helpdesk-linux
```

Validate before restart:

```bash
sudo sshd -t
sudo systemctl restart ssh
```
