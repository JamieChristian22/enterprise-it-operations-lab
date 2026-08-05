# Incident Response Policy

## 1. Purpose

This policy defines how incidents are identified, prioritized, escalated, communicated, resolved, reviewed, and closed.

## 2. Scope

This policy applies to incidents affecting:

- End-user productivity
- Active Directory
- Microsoft 365
- VPN and remote access
- Windows endpoints and servers
- Network services
- Shared files and business applications
- Security-related service disruptions

## 3. Policy Statements

1. Every incident must have a unique incident ID.
2. Priority must be based on impact and urgency.
3. P1 and P2 incidents require an Incident Commander.
4. P1 incidents require stakeholder updates every 15 minutes.
5. P2 incidents require stakeholder updates every 30 minutes.
6. Technical actions must be recorded in a timestamped timeline.
7. Workarounds must be documented and communicated to the Service Desk.
8. Service restoration must be validated before closure.
9. P1 and P2 incidents require a post-incident review.
10. Corrective actions must have owners and due dates.
11. Recurring incidents must be linked to a problem record.
12. Permanent fixes requiring controlled implementation must be linked to a change record.

## 4. Roles

| Role | Responsibility |
|---|---|
| Incident Reporter | Reports symptoms and business impact |
| Service Desk Analyst | Creates ticket, gathers evidence, performs initial triage |
| Incident Commander | Coordinates response, decisions, communications, and restoration |
| Technical Lead | Directs technical investigation and recovery |
| Communications Lead | Issues stakeholder updates |
| Service Owner | Accepts business risk and confirms recovery |
| Problem Manager | Owns root-cause analysis and corrective actions |
| Change Manager | Controls permanent fixes requiring change approval |

## 5. Declaration Criteria

A major incident may be declared when:

- A critical business service is unavailable
- Multiple departments are unable to work
- Authentication or identity services fail
- Remote access is broadly unavailable
- A security event creates material operational impact
- Leadership escalation is required
- Recovery requires coordination across multiple teams

## 6. Closure Requirements

An incident may be closed only when:

- Service is restored
- Recovery validation is complete
- Stakeholders have been notified
- Root cause or probable cause is documented
- Follow-up actions are assigned
- Related problem and change records are linked
- The Service Owner confirms recovery where applicable
