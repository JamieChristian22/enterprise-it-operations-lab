# Linux Firewall Baseline

## UFW Example

```bash
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow from 10.20.30.0/24 to any port 22 proto tcp
sudo ufw logging medium
sudo ufw enable
```

Review every exposed port and service owner.
