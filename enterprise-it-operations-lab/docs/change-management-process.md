# Change Management Process

**Owner:** IT Operations  
**Version:** 1.0

## Purpose
Reduce avoidable outages by ensuring changes are documented, risk-assessed, tested, approved, validated, and recoverable.

## Change types
| Type | Definition | Approval |
|---|---|---|
| Standard | Pre-approved, low-risk, repeatable procedure | Procedure owner |
| Normal | Planned change requiring risk review and approval | Change approver |
| Emergency | Urgent action needed to restore service or address critical risk | Incident lead or emergency approver |

## Required change fields
- Change ID and title
- Business reason
- Scope and affected assets
- Risk and impact rating
- Implementation plan
- Validation plan
- Rollback plan
- Maintenance window
- Owner and approver
- Communication plan
- Related incident, request, or problem
- Actual result and lessons learned

## Risk scoring
Evaluate:
- Number of users affected
- Criticality of the service
- Complexity and reversibility
- Prior test results
- Dependency uncertainty
- Security and compliance impact

A high-risk change requires peer review, a tested rollback, clear outage communication, and enhanced monitoring.

## Implementation workflow
1. Submit the change.
2. Confirm technical and business scope.
3. Review conflicts and dependencies.
4. Test in a lab or pilot group.
5. Approve or reject.
6. Communicate the maintenance window.
7. Capture pre-change health evidence.
8. Implement the documented steps.
9. Perform validation.
10. Roll back when success criteria are not met.
11. Monitor after implementation.
12. Close with actual outcome.

## Standard change examples
- Approved user onboarding procedure
- Approved password reset after identity verification
- Routine patch deployment to a pilot ring
- Adding a user to a documented access group with authorization
- Restarting a noncritical service according to an approved runbook

## Emergency change rules
- Link the change to the active incident.
- Record the reason normal review could not be completed.
- Use the smallest change necessary.
- Preserve logs and evidence.
- Complete retrospective review by the next business day.

## Failed change response
1. Stop further implementation.
2. Execute rollback.
3. Validate service restoration.
4. Open or update an incident if service is impaired.
5. Record the failure point and evidence.
6. Create corrective actions before rescheduling.

## Change success metrics
- Change success rate
- Emergency change percentage
- Failed change rate
- Incidents caused by change
- Average approval lead time
- Percentage with complete rollback evidence
