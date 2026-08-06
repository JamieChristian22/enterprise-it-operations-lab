# Enterprise Identity Operations

A portfolio-ready identity administration package demonstrating hybrid identity operations, privileged access governance, administrative tiering, troubleshooting, change control, and PowerShell automation.

> **Lab disclosure:** All domains, users, identifiers, event records, tickets, and outputs are fictional or sanitized lab artifacts. They demonstrate process and technical capability without representing a live production environment.

## Business Scenario

Northstar Logistics operates a Windows Server Active Directory domain synchronized to Microsoft Entra ID. The systems administration team must protect privileged identities, maintain reliable synchronization, resolve identity conflicts, and produce auditable evidence for changes and access reviews.

## Environment

| Component | Lab Configuration |
|---|---|
| Active Directory | `corp.northstarlab.local` |
| Microsoft Entra tenant | `northstarlab.onmicrosoft.com` |
| Routable UPN | `northstarlab.com` |
| Domain controllers | `NS-DC01`, `NS-DC02` |
| Entra Connect servers | `NS-AADCON01` active, `NS-AADCON02` staging |
| Privileged workstation | `NS-PAW01` |
| Management server | `NS-MGMT01` |
| SIEM/log workspace | `NS-SECOPS` |

## Capabilities Demonstrated

- Hybrid identity synchronization health validation
- Duplicate attribute and soft-match troubleshooting
- Controlled Entra Connect staging-server failover
- Tier 0, Tier 1, and Tier 2 administrative separation
- Privileged account naming and logon restrictions
- Break-glass account governance
- Privileged group change auditing
- Access review evidence collection
- Incident, change, rollback, and post-change documentation

## Repository Map

- `architecture/` — identity and administrative-tier diagrams
- `runbooks/` — repeatable operational procedures
- `standards/` — identity governance and security requirements
- `scripts/` — PowerShell health, audit, and evidence automation
- `evidence/` — sanitized sample outputs and reports
- `incidents/` — realistic resolved identity incidents
- `checklists/` — validation and review checklists
- `change-management/` — completed change record and rollback plan

## Suggested Demonstration Flow

1. Review `architecture/hybrid-identity-architecture.svg`.
2. Run `scripts/Test-IdentitySyncHealth.ps1` on a management workstation.
3. Run `scripts/Find-DuplicateIdentityAttributes.ps1` before synchronization changes.
4. Review the tiering controls in `standards/administrative-tiering-standard.md`.
5. Examine the resolved incidents and completed change record.
6. Compare outputs with the sanitized evidence files.

## Outcome

This package shows how a systems administrator can operate identity services with repeatable procedures, security controls, auditability, and business-aware change management rather than relying on undocumented one-off actions.
