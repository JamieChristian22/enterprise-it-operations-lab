# Service Dependency Map

| Business service | Primary components | Critical dependencies | Monitoring | Recovery option |
|---|---|---|---|---|
| Workforce authentication | AD DS, DNS, DHCP, domain controllers | Network, time synchronization, healthy SRV records | DNS service check, LDAP bind, synthetic logon | Secondary domain controller and DNS resolver |
| Corporate email | Exchange Online, Outlook, mail connector | Microsoft 365 identity, DNS, connector certificate | Mail-flow probe, message trace, Service Health | Disable faulty connector or route directly |
| Shared file services | Windows file server, NTFS, storage volume | AD, DNS, VMware, backup | Volume capacity, SMB probe, event logs | Expand volume, restore share, alternate namespace |
| Customer portal | IIS/reverse proxy, application, TLS certificate | DNS, certificate chain, application database | HTTPS synthetic transaction, certificate expiry | Renew certificate, fail over application node |
| Site connectivity | SD-WAN appliance, ISP circuits, VPN | Carrier edge, routing, DNS | Loss/latency/jitter, tunnel state | Secondary ISP and manual/automatic failover |
| Endpoint security | Defender for Endpoint, Intune, Entra ID | Network, identity, security portal | EDR alerts, device compliance | Device isolation and credential revocation |
| Virtual server platform | vCenter, ESXi hosts, shared datastore | Network, storage, power | CPU ready, memory ballooning, datastore latency | vMotion and host evacuation |
| Backup and recovery | Veeam, repository, service accounts | Network, storage, virtualization APIs | Job success, repository capacity, restore tests | Repair chain, active full, alternate repository |
