# Architecture Assumptions

- Windows Server 2022 is used for Active Directory and core Windows services.
- Linux servers use Ubuntu or Rocky Linux.
- AWS workloads use private application and database subnets.
- Administrative access originates from the management VLAN.
- Microsoft 365 uses synchronized hybrid identity.
- Backup design follows 3-2-1-1-0.
- PKI uses an offline root CA and enterprise issuing CA.
- Monitoring uses Prometheus, Grafana, Alertmanager, and centralized logs.
