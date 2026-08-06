# Environment Baseline

**Owner:** Infrastructure Operations  
**Version:** 1.0  
**Last reviewed:** August 6, 2026

## Logical inventory
| Asset | Name | Platform | Purpose | Criticality | Owner |
|---|---|---|---|---|---|
| Domain controller | NS-DC01 | Windows Server 2022 | AD DS, DNS | Critical | Systems Administration |
| Member server | NS-FS01 | Windows Server 2022 | File services and shared folders | High | Systems Administration |
| Linux server | NS-LNX01 | Ubuntu Server 24.04 LTS | Web and operations testing | Medium | Cloud Operations |
| Admin workstation | NS-ADM01 | Windows 11 Enterprise | Privileged administration | High | IT Operations |
| User workstation | NS-WKS01 | Windows 11 Enterprise | Endpoint support testing | Medium | Endpoint Operations |
| AWS application host | ns-ec2-app01 | Amazon Linux 2023 | Cloud workload and monitoring | High | Cloud Operations |
| Microsoft 365 tenant | northstar-lab | Microsoft 365 | Identity and productivity services | Critical | Cloud Administration |

## Network plan
### On-premises lab
| Network | CIDR | Purpose |
|---|---|---|
| Server VLAN | 10.20.10.0/24 | Domain and member servers |
| Client VLAN | 10.20.20.0/24 | User workstations |
| Management VLAN | 10.20.30.0/24 | Administrative access |

### AWS
| Component | CIDR / placement | Purpose |
|---|---|---|
| VPC | 10.50.0.0/16 | Isolated cloud environment |
| Public subnet A | 10.50.10.0/24 | Internet-facing components only |
| Private subnet A | 10.50.20.0/24 | Application workloads |
| Public subnet B | 10.50.11.0/24 | Multi-AZ design demonstration |
| Private subnet B | 10.50.21.0/24 | Multi-AZ design demonstration |

## Naming standard
- Windows servers: `NS-[ROLE][NN]`, such as `NS-DC01`.
- Workstations: `NS-WKS[NN]`.
- Administrative devices: `NS-ADM[NN]`.
- AWS resources: `ns-[service]-[purpose]-[environment]`.
- Security groups: `sg-[workload]-[direction]-[environment]`.
- Group Policy Objects: `GPO-[Scope]-[Purpose]`.
- AD security groups: `GG-[Department]-[Access]` for global groups.

## Identity baseline
- Forest and domain: `northstar.lab`
- Organizational Units: Users, Workstations, Servers, Groups, Service Accounts, Disabled Objects
- Privileged administration is separated from standard user accounts.
- Shared-folder access is assigned to groups, not directly to individual users.
- Service accounts are documented, non-interactive where possible, and denied local logon unless required.

## Endpoint baseline
- BitLocker enabled where supported.
- Microsoft Defender active.
- Firewall enabled for all profiles.
- Screen lock after 15 minutes.
- Local administrator membership restricted.
- Quality and security updates managed through a documented update ring.
- Compliance checks include encryption, antimalware, password, and operating-system version.

## Server baseline
- Static IP addresses for core infrastructure.
- Time synchronized to an approved source.
- Remote administration restricted to management networks or approved tooling.
- Audit logging enabled for authentication, policy change, service failure, and administrative actions.
- Unused roles and services removed.
- Backup policy assigned before production acceptance.

## AWS baseline
- No shared IAM users.
- MFA required for privileged access.
- Security groups permit only required ports and sources.
- CloudWatch agent or native metrics enabled.
- Systems Manager preferred over direct SSH where available.
- EBS encryption enabled.
- AWS Backup plan assigned to protected resources.
- CloudTrail enabled for account-level activity tracking.

## Configuration authority
| Configuration type | Source of truth |
|---|---|
| Windows policy | Group Policy and documented baseline |
| Endpoint policy | Intune configuration and compliance profiles |
| AWS infrastructure | Terraform configuration |
| Operational procedures | This `docs` folder |
| Incident and change history | Ticket and change records |
| Monitoring thresholds | Dashboard and alert configuration files |

## Baseline validation
A system is considered compliant when hostname, IP configuration, time, patch level, security controls, logging, monitoring, and backup assignment match this document and the related implementation evidence.
