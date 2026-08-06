# 🏗️ Enterprise IT Operations Architecture

![Architecture](https://img.shields.io/badge/Architecture-Enterprise%20IT-6A5ACD?style=for-the-badge)
![AWS](https://img.shields.io/badge/AWS-Hybrid%20Cloud-FF9900?style=for-the-badge&logo=amazonaws&logoColor=white)
![Active Directory](https://img.shields.io/badge/Active%20Directory-Identity-0078D4?style=for-the-badge&logo=microsoft&logoColor=white)
![Networking](https://img.shields.io/badge/Networking-Segmentation-0052CC?style=for-the-badge)
![DR](https://img.shields.io/badge/Resilience-Backup%20%26%20DR-success?style=for-the-badge)

A production-style enterprise architecture package for a hybrid IT operations environment spanning on-premises infrastructure, AWS, Active Directory, Microsoft 365, PKI, monitoring, security, backup, and disaster recovery.

## Business Scenario

Northstar Services operates:

- Headquarters
- Two distribution sites
- On-premises Windows and Linux infrastructure
- Microsoft 365
- AWS production workloads
- Centralized monitoring and logging
- Enterprise PKI
- Backup and disaster recovery services

This architecture package documents how systems, networks, identities, services, and operational controls fit together.

## Design Goals

- Segment users, servers, management, printers, voice, and guests.
- Protect administrative access.
- Use hybrid identity and DNS.
- Keep AWS workloads in private subnets.
- Use Systems Manager for administrative access.
- Centralize monitoring and alerting.
- Support tested backup and disaster recovery.
- Maintain clear service ownership and dependencies.
- Document decisions and failure domains.

## Architecture Contents

- Hybrid enterprise overview
- Network segmentation
- AWS VPC architecture
- Active Directory topology
- Monitoring data flow
- Backup and DR architecture
- Microsoft 365 identity flow
- PKI trust hierarchy
- Service dependency map
- IP, VLAN, routing, firewall, and port standards
- High availability and failure-domain analysis
- RTO/RPO map
- Architecture Decision Records
- Server and service inventories
