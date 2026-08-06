# SSH Administration and Hardening

## Required Controls

- SSH protocol 2
- Root login disabled
- Password authentication disabled
- Public-key authentication enabled
- Empty passwords prohibited
- Reduced authentication attempts
- Idle sessions disconnected
- Access limited to approved groups
- Administrative subnet restricted by firewall

## Deployment

```bash
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.pre-hardening
sudo cp configuration/sshd_config /etc/ssh/sshd_config
sudo sshd -t
sudo systemctl restart ssh
```

Keep an existing administrative session open until a second session confirms successful key-based access.

## Validation

```bash
sudo sshd -T | grep -E \
'permitrootlogin|passwordauthentication|pubkeyauthentication|maxauthtries|clientalive'
sudo ss -ltnp | grep ':22'
sudo ufw status numbered
```

## Troubleshooting

```bash
journalctl -u ssh --since "-30 minutes"
sudo tail -n 100 /var/log/auth.log
ssh -vvv admin@10.20.30.15
```
