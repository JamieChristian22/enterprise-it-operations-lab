# Change Management Policy

## 1. Purpose

The purpose of this policy is to ensure that technology changes are introduced in a controlled, documented, risk-aware, and recoverable manner.

## 2. Scope

This policy applies to changes affecting the simulated enterprise Help Desk environment, including:

- Active Directory objects and policies
- Windows endpoints and servers
- Microsoft 365 support processes
- Network and VPN configurations
- Help Desk automation
- Monitoring and alerting
- Knowledge base and service catalog workflows

## 3. Policy Statements

1. Every production-impacting change must have a unique change ID.
2. Changes must include business justification, scope, risk, implementation, validation, rollback, communication, and approval.
3. No normal or emergency change may begin without documented authorization.
4. Standard changes must follow an approved, repeatable procedure.
5. Changes must not be scheduled during restricted business periods unless emergency authorization is granted.
6. The Change Owner must preserve evidence of implementation and validation.
7. Unsuccessful changes must be rolled back or formally accepted by the Service Owner with an active incident.
8. All changes must receive a closure decision within two business days of implementation.
9. Emergency changes must receive retrospective review within one business day.
10. Metrics must be reviewed monthly for failure trends, unauthorized work, excessive emergencies, and recurring rollback causes.

## 4. Roles

| Role | Accountability |
|---|---|
| Requester | Defines the need and business outcome |
| Change Owner | Plans, implements, validates, and documents the change |
| Service Owner | Accepts service risk and confirms business outcome |
| Change Manager | Reviews quality, schedules work, and maintains the register |
| CAB | Evaluates normal changes for risk, conflict, readiness, and value |
| Emergency Change Authority | Approves urgent restoration or risk-reduction work |
| Service Desk | Receives user-impact information and provides first-line support |
| Security Reviewer | Evaluates access, security, audit, and compliance implications |

## 5. Change Classification

### Standard Change

A low-risk, frequent, repeatable change with a proven implementation and rollback method.

Examples:

- Deploying an approved Outlook profile repair script
- Adding a user to an approved access group
- Installing an approved endpoint application version

### Normal Change

A planned change requiring assessment, approval, scheduling, and validation.

Examples:

- Updating the domain password policy
- Modifying VPN configuration
- Changing shared-folder permission design

### Emergency Change

An urgent change required to restore a major service, prevent material damage, or reduce an immediate security risk.

Examples:

- Correcting a VPN DNS configuration causing a widespread outage
- Blocking a confirmed malicious domain
- Reverting a failed authentication configuration

## 6. Approval Rules

| Risk | Required Approval |
|---|---|
| Low | Change Manager or delegated Service Owner |
| Moderate | Change Manager and Service Owner |
| High | CAB, Service Owner, and Security Reviewer |
| Critical | Executive Service Owner and CAB Chair |
| Emergency | Emergency Change Authority; retrospective CAB review required |

## 7. Scheduling Controls

- Planned changes are scheduled in approved maintenance windows.
- Conflicting changes affecting the same service are not scheduled concurrently.
- User-impacting changes require advance notification.
- High-risk changes require technical support coverage during implementation.
- Backups and baseline evidence must be confirmed before implementation.

## 8. Closure Requirements

A change may be closed only when:

- Implementation results are recorded.
- Validation tests are complete.
- User or service owner confirmation is documented when applicable.
- Incidents and deviations are linked.
- Evidence is stored.
- Follow-up actions have owners and due dates.
