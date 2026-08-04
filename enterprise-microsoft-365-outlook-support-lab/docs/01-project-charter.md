# Project Charter

## Project Name
Enterprise Microsoft 365 Outlook Support Lab

## Sponsor
Contoso Corporation IT Operations

## Project Owner
Jamie Christian, IT Support Technician

## Problem Statement
A Finance user cannot launch Microsoft Outlook after Windows updates. The loss of email and calendar access affects customer communication, scheduling, and daily operations.

## Scope

### In Scope
- Incident intake and prioritization
- Microsoft 365 user, license, and service-health validation
- Local Outlook process analysis
- Windows Application log analysis
- Outlook Safe Mode testing
- Microsoft 365 Apps Quick Repair
- Functional verification
- Root cause analysis
- Customer communication
- Ticket closure
- Knowledge article creation
- Evidence-collection scripts

### Out of Scope
- Exchange Online mailbox repair
- Tenant-wide Conditional Access changes
- Endpoint reimaging
- Hardware replacement
- Production credential handling
- Destructive registry changes
- Automated profile deletion

## Deliverables
1. Complete incident record
2. Troubleshooting runbook
3. Root cause analysis
4. Post-incident review
5. Knowledge-base article
6. Customer communication record
7. PowerShell diagnostic utilities
8. Verification checklist
9. Resume and interview guide
10. Evidence mapping

## Acceptance Criteria
- All files are fully populated.
- The incident narrative is consistent across documents.
- Scripts are nondestructive and include error handling.
- The resolution is technically plausible and proportionate.
- Verification includes user confirmation and objective checks.
- No sensitive or real production data is included.

## Risks and Controls
| Risk | Impact | Control |
|---|---|---|
| Incorrect root cause claim | Misleading documentation | Separate confirmed evidence from assumptions |
| Overly disruptive remediation | User downtime | Use least disruptive action first |
| Sensitive data exposure | Security/privacy issue | Use fictional identities and scrub outputs |
| Incomplete verification | Incident recurrence | Use a documented verification checklist |
| Unclear escalation | Delayed resolution | Follow the escalation matrix |
