# Server Build Guide

## 1. Install and Identify the Server

Install Ubuntu Server 24.04 LTS with OpenSSH Server enabled.

```bash
sudo hostnamectl set-hostname nss-linux-01
sudo timedatectl set-timezone America/New_York
hostnamectl
timedatectl
```

## 2. Apply the Static Network Configuration

Example Netplan configuration:

```yaml
network:
  version: 2
  ethernets:
    enp0s3:
      addresses:
        - 10.20.30.15/24
      routes:
        - to: default
          via: 10.20.30.1
      nameservers:
        addresses:
          - 10.20.30.10
          - 1.1.1.1
```

Validate before applying:

```bash
sudo netplan generate
sudo netplan try
ip -br address
ip route
resolvectl status
```

## 3. Install Administrative Packages

```bash
sudo apt update
sudo apt install -y acl curl jq rsync ufw unattended-upgrades auditd
```

## 4. Create Administrative Groups and Paths

```bash
sudo groupadd -f linux-admins
sudo groupadd -f helpdesk-linux
sudo install -d -o root -g linux-admins -m 2770 /srv/company-share
sudo install -d -o root -g root -m 0700 /var/backups/northstar
sudo install -d -o root -g root -m 0755 /opt/northstar-api
```

## 5. Configure SSH, Sudo, Firewall, and systemd

Copy the supplied files into place, validate them, and then restart or reload the affected service.

## 6. Establish the Baseline

```bash
sudo bash scripts/server-health-check.sh
sudo bash tests/test-security-controls.sh
sudo bash tests/test-user-provisioning.sh
```

Retain the output as evidence.
