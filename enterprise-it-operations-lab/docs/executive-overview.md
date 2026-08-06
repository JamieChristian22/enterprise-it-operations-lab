# Executive Overview

**Document owner:** IT Operations  
**Version:** 2.0  
**Effective date:** August 6, 2026  
**Classification:** Portfolio / Simulated Enterprise

## Business scenario
Northstar Business Services is a fictional 150-user organization with a remote workforce, a small headquarters, Microsoft 365 productivity services, on-premises identity infrastructure, and AWS-hosted application workloads. The organization requires reliable user access, secure endpoint management, predictable incident handling, recoverable systems, and measurable service performance.

## Program objective
Build and operate a repeatable hybrid IT environment that demonstrates enterprise-level practices for:

- User lifecycle administration
- Endpoint configuration and compliance
- Windows and Linux server operations
- Microsoft 365 support
- AWS infrastructure operations
- Monitoring, backup, patching, and recovery
- Incident, problem, and change management
- Documentation and audit-ready evidence

## Scope
### In scope
- Active Directory, DNS, DHCP, Group Policy, and delegated administration
- Entra ID synchronization concepts, MFA, and Conditional Access
- Intune enrollment, compliance, and configuration profiles
- Windows and Linux server baselines
- AWS networking, EC2, CloudWatch, Systems Manager, and backup
- Operational dashboards, alerts, runbooks, tickets, and evidence

### Out of scope
- Real customer data
- Production payment systems
- Internet-facing production applications
- Regulated workloads requiring formal certification
- High-availability domain controller clusters across physical data centers

## Target architecture
The environment uses a hybrid identity model. Active Directory provides domain services for lab servers and Windows clients. Entra ID and Intune represent cloud identity and endpoint management. AWS hosts isolated infrastructure in private and public subnets with security groups, monitoring, backup, and remote administration through Systems Manager where possible.

## Operating principles
1. Least privilege and role-based access.
2. Standardized naming, logging, and documentation.
3. Automation for repeatable administrative work.
4. Monitoring before failure and validation after change.
5. Recovery procedures tested rather than assumed.
6. Evidence linked to every major operational claim.

## Key service targets
| Measure | Target |
|---|---:|
| Core identity availability | 99.9% monthly |
| P1 acknowledgment | 15 minutes |
| P2 acknowledgment | 30 minutes |
| Standard request fulfillment | 1 business day |
| Critical patch compliance | 95% within 14 days |
| Standard patch compliance | 95% within 30 days |
| Backup job success | 98% monthly |
| Quarterly restore test success | 100% |
| MFA coverage for privileged users | 100% |
| Access review completion | 100% quarterly |

## Success criteria
The lab is accepted when:

- Identity, DNS, endpoint, server, and cloud services pass documented validation tests.
- Monitoring alerts create actionable evidence and lead to a runbook.
- Backup and restore procedures are demonstrated.
- At least one incident, one request, one change, and one problem record are documented end-to-end.
- Procedures contain owners, validation steps, rollback or recovery actions, and escalation criteria.
- Claims in the portfolio can be traced to a file, script, ticket, dataset, dashboard, or diagram.

## Portfolio value
This project demonstrates practical readiness for IT Support Engineer, Cloud Operations Analyst, Junior Systems Administrator, Infrastructure Support Engineer, and Cloud Support Associate roles. It shows not only technical configuration, but the operating discipline required to keep services reliable after deployment.
