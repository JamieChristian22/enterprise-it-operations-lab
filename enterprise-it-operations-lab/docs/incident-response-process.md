# Incident Response Process

**Owner:** Service Operations  
**Version:** 1.0

## Purpose
Restore normal service quickly, limit business impact, preserve evidence, and ensure communication is accurate and timely.

## Lifecycle
1. Detect and record.
2. Categorize and prioritize.
3. Assign ownership.
4. Diagnose and contain.
5. Restore service.
6. Validate with users and monitoring.
7. Document and close.
8. Create a problem record when recurrence or risk justifies deeper analysis.

## Required incident fields
- Incident ID
- Reporter and contact method
- Detection time
- Affected service and assets
- Symptoms and error messages
- Impacted users or locations
- Impact and urgency
- Priority
- Actions performed with timestamps
- Workaround and restoration time
- Root cause or suspected cause
- Validation evidence
- Closure code and knowledge linkage

## Initial triage questions
- What changed before the issue started?
- Is the issue isolated or widespread?
- Can the problem be reproduced?
- Is identity, DNS, network, endpoint, server, application, or cloud infrastructure the likely layer?
- Is there a known error or recent change?
- Is there a security concern requiring containment?

## Major incident procedure
1. Assign an incident lead.
2. Establish a technical workstream and communication channel.
3. Confirm scope and business impact.
4. Freeze unrelated changes affecting the service.
5. Publish an initial status update.
6. Track hypotheses, actions, owners, and results.
7. Restore service using the lowest-risk viable action.
8. Validate recovery with telemetry and affected users.
9. Publish closure communication.
10. Schedule a post-incident review within two business days.

## Communication template
**Status:** Investigating / Identified / Monitoring / Resolved  
**Affected service:** [service name]  
**Impact:** [plain-language impact]  
**Start time:** [time]  
**Current action:** [what the team is doing]  
**Workaround:** [available workaround or none]  
**Next update:** [time]

## Security escalation triggers
Escalate immediately for:
- Suspected credential theft
- Unexpected privileged-account activity
- Malware or ransomware indicators
- Data exposure
- Repeated successful sign-ins from impossible or unexpected locations
- Unauthorized firewall, IAM, or security-group changes

## Closure criteria
An incident closes only when:
- Service is restored or an accepted workaround is in place.
- Monitoring confirms stability.
- The requester or service owner is informed.
- Actions and timestamps are complete.
- Related change, problem, and knowledge records are linked.
- Residual risk is assigned to an owner.

## Post-incident review
The review captures timeline, impact, detection gaps, root cause, contributing factors, what worked, what failed, corrective actions, owners, and due dates. The purpose is learning and prevention, not blame.
