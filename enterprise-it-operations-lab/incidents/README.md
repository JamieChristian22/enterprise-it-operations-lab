# Enterprise IT Operations Incident Management Portfolio

This folder contains a complete, simulated enterprise incident-management portfolio for a 750-user, multi-site organization. The records demonstrate service restoration, technical troubleshooting, stakeholder communication, root-cause analysis, corrective-action ownership, SLA measurement, and problem-prevention practices across identity, network, Microsoft 365, storage, certificates, backup, endpoint security, and virtualization services.

> **Portfolio disclosure:** All organizations, systems, users, dates, ticket identifiers, metrics, and evidence references are fictional but modeled on realistic enterprise IT operations. No production data or confidential information is included.

## Environment

| Area | Technologies |
|---|---|
| Identity | Windows Server 2022, Active Directory Domain Services, DNS, DHCP, Group Policy |
| Endpoint | Windows 11 Enterprise, Microsoft Defender for Endpoint, Intune |
| Collaboration | Microsoft 365, Exchange Online, Outlook, Teams |
| Network | Dual-ISP SD-WAN, site-to-site VPN, VLANs, SNMP and synthetic monitoring |
| Infrastructure | VMware vSphere, Windows file services, Veeam Backup & Replication |
| Monitoring | PRTG-style infrastructure monitoring, Microsoft 365 Service Health, SIEM alerts |
| ITSM | Incident, problem, change, knowledge, SLA, and corrective-action records |

## Incident Portfolio

| Incident | Severity | Service | Duration | Primary capability demonstrated |
|---|---:|---|---:|---|
| [INC-1007](INC-1007-domain-authentication-outage.md) | SEV-1 | AD DS / DNS | 74 min | Identity outage command, DNS/DHCP troubleshooting |
| [INC-1018](INC-1018-wan-packet-loss-rca.md) | SEV-2 | WAN / Voice | 96 min | Packet-loss isolation, SD-WAN failover, carrier escalation |
| [INC-1024](INC-1024-microsoft-365-mail-flow-disruption.md) | SEV-2 | Exchange Online | 68 min | Mail-flow triage, connector rollback, message tracing |
| [INC-1031](INC-1031-fileserver-capacity-event.md) | SEV-2 | File Services | 52 min | Storage recovery, quota controls, capacity management |
| [INC-1042](INC-1042-expired-tls-certificate-outage.md) | SEV-1 | Customer Portal | 43 min | TLS restoration, certificate-chain validation |
| [INC-1055](INC-1055-backup-job-failure.md) | SEV-3 | Backup | 6 hr detection window | Backup-chain repair and restore validation |
| [INC-1063](INC-1063-endpoint-malware-containment.md) | SEV-2 | Endpoint Security | 61 min containment | Isolation, credential reset, threat hunting |
| [INC-1071](INC-1071-virtualization-host-resource-exhaustion.md) | SEV-2 | VMware | 57 min | Host resource triage, workload evacuation |

## Governance Files

- [Incident severity matrix](incident-severity-matrix.md)
- [Major incident operating procedure](major-incident-operating-procedure.md)
- [Incident report template](incident-report-template.md)
- [Communication templates](incident-communication-templates.md)
- [Corrective action register](corrective-action-register.csv)
- [Incident metrics](incident-metrics.csv)
- [Service dependency map](service-dependency-map.md)
- [Lessons learned register](lessons-learned-register.md)

## Operating Model

1. Monitoring or the service desk creates the incident.
2. The on-call analyst validates scope and assigns severity.
3. SEV-1 and SEV-2 incidents receive an incident commander and technical lead.
4. The team prioritizes mitigation and service restoration before permanent repair.
5. Updates are issued on the defined cadence.
6. Recovery is validated with technical checks and user confirmation.
7. A problem record and RCA are opened for qualifying incidents.
8. Corrective actions are tracked to closure with owners, dates, and evidence.
9. Metrics are reviewed during the monthly operations review.

## Portfolio Outcomes

This package demonstrates the ability to:

- manage high-impact incidents under time pressure;
- document decisions and technical evidence;
- distinguish trigger, direct cause, root cause, contributing factors, and control failures;
- calculate MTTD, MTTA, time to mitigation, and MTTR;
- coordinate infrastructure, security, application, service-desk, and vendor teams;
- create durable prevention through monitoring, change controls, runbooks, automation, and ownership.
