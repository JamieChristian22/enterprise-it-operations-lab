# Enterprise Change Management Policy

## Purpose
Ensure infrastructure changes are planned, authorized, tested, communicated, implemented, validated, and reviewed with minimal business disruption.

## Scope
Applies to production servers, Active Directory, DNS, DHCP, network services, backups, storage, Microsoft 365, endpoint policy, monitoring, and automation.

## Policy Requirements
1. Every production change must have a unique change ID.
2. Every change must identify business impact, technical impact, affected configuration items, dependencies, implementation steps, validation steps, and rollback steps.
3. Normal changes require technical-owner approval and CAB approval before scheduling.
4. Standard changes must use a preapproved procedure and remain within the documented risk boundary.
5. Emergency changes require Incident Commander and IT Operations Manager approval, followed by retrospective CAB review within two business days.
6. High-risk changes require tested rollback, maintenance-window approval, and business-owner signoff.
7. Evidence must include pre-change health, implementation results, post-change validation, and closure notes.
8. Failed or backed-out changes require a post-implementation review and problem record when recurrence risk exists.
9. Segregation of duties applies: the implementer may not be the sole approver of a high-risk change.
10. Records are retained for three years.

## Success Criteria
- Change success rate at or above 95%
- Emergency changes below 10% of monthly volume
- Unauthorized changes at 0%
- Post-implementation reviews completed within two business days for failed changes
