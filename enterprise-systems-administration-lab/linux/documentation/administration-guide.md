# Linux Administration Guide

## Daily Checks

```bash
hostnamectl
uptime
systemctl --failed
df -hT
df -i
free -h
ss -tulpn
journalctl -p warning --since today
```

## User Administration

```bash
sudo adduser username
sudo usermod -aG linux-admins username
id username
sudo passwd -l username
sudo usermod --expiredate 1 username
sudo deluser --remove-home username
```

## Permissions

```bash
sudo chown -R root:linux-admins /srv/company-share
sudo chmod 2770 /srv/company-share
sudo setfacl -m g:helpdesk-linux:rx /srv/company-share
getfacl /srv/company-share
```

The setgid bit ensures new files inherit the directory group.

## Service Administration

```bash
systemctl status northstar-api
sudo systemctl restart northstar-api
journalctl -u northstar-api --since "-30 minutes"
systemctl show northstar-api -p ActiveState -p SubState -p Result
```

## Networking

```bash
ip -br address
ip route
resolvectl status
ping -c 4 10.20.30.1
getent hosts example.com
ss -tulpn
curl -I http://127.0.0.1:8080
```

## Storage

```bash
lsblk -f
findmnt
df -hT
df -i
sudo du -xhd1 /var | sort -h
```

## Logs

```bash
journalctl --since today
journalctl -p err
sudo tail -n 100 /var/log/auth.log
sudo grep "Failed password" /var/log/auth.log
```

## Patch Management

```bash
sudo apt update
apt list --upgradable
sudo apt upgrade
test -f /var/run/reboot-required && cat /var/run/reboot-required.pkgs
```

## Backup Validation

A backup is incomplete until restoration is tested. Validate archive readability, restore to a temporary directory, compare checksums, and document the result.
