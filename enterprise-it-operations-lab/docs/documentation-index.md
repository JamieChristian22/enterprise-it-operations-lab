# Documentation and Evidence Index

**Owner:** Portfolio Administrator  
**Version:** 1.0

## Traceability matrix
| Capability | Primary document | Supporting artifact expected |
|---|---|---|
| Hybrid architecture | `executive-overview.md` | Architecture diagram |
| Asset and network standards | `environment-baseline.md` | Inventory and network diagram |
| AD and DNS deployment | `implementation-guide.md` | Validation output and configuration records |
| Endpoint management | `implementation-guide.md` | Intune policy export or evidence record |
| AWS deployment | `implementation-guide.md` | Terraform files and plan output |
| Daily operations | `operations-handbook.md` | Completed checklist and dashboard export |
| Incident handling | `incident-response-process.md` | Resolved incident record |
| Change control | `change-management-process.md` | Approved and completed change record |
| Troubleshooting | `troubleshooting-guide.md` | Diagnostic transcript or ticket notes |
| Service performance | `service-level-objectives.md` | KPI dashboard or monthly report |
| Recurring issues | `known-errors-and-problem-management.md` | Problem record and known-error entry |
| Interview presentation | `portfolio-evidence-guide.md` | Curated evidence set |
| Role alignment | `skills-matrix.md` | Resume project bullets |

## Evidence quality rules
A strong evidence artifact must be:
- Sanitized
- Legible
- Dated
- Tied to a documented task
- Clear about expected and actual results
- Free of secrets and personal data
- Named consistently

## Recommended naming
`YYYYMMDD-category-short-description.ext`

Examples:
- `20260806-identity-ad-health-validation.txt`
- `20260806-change-gpo-security-baseline.md`
- `20260806-aws-cloudwatch-alarm-test.json`
- `20260806-backup-restore-validation.md`

## Claim-to-evidence rule
Avoid unsupported volume claims. State exact counts only when the repository contains the corresponding completed artifacts. Prefer verifiable language such as “documented incident and service-request scenarios” over an unverified ticket total.
