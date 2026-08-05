# Change Record — CHG-YYYY-NNN

## 1. Record Control

| Field | Value |
|---|---|
| Change ID | CHG-YYYY-NNN |
| Title | Concise change title |
| Change Type | Standard / Normal / Emergency |
| Status | Draft / Assess / Awaiting Approval / Scheduled / Implemented / Closed / Backed Out |
| Requested By | Requester name and role |
| Change Owner | Accountable implementer |
| Service Owner | Business or technical service owner |
| Related Ticket or Incident | INC-, SR-, PRB-, or project reference |
| Date Submitted | YYYY-MM-DD |
| Planned Start | YYYY-MM-DD HH:MM TZ |
| Planned End | YYYY-MM-DD HH:MM TZ |
| Actual Start | YYYY-MM-DD HH:MM TZ |
| Actual End | YYYY-MM-DD HH:MM TZ |

## 2. Executive Summary

Describe the proposed change in two to four sentences, including the business outcome, affected service, and reason the change is necessary.

## 3. Business Justification

Explain the operational problem, security requirement, user impact, compliance requirement, or efficiency opportunity addressed by the change.

## 4. Scope

### In Scope

- List affected systems, users, locations, policies, applications, or devices.

### Out of Scope

- List items intentionally excluded from the change.

## 5. Systems and Services Affected

| Configuration Item | Environment | Role | Expected Impact |
|---|---|---|---|
| Example system | Lab | Service component | No outage / degraded service / planned interruption |

## 6. Risk and Impact Assessment

| Factor | Score | Rationale |
|---|---:|---|
| Likelihood of failure | 1–5 | Explain |
| User impact | 1–5 | Explain |
| Service criticality | 1–5 | Explain |
| Rollback complexity | 1–5 | Explain |
| Security exposure | 1–5 | Explain |

**Overall risk score:** Sum of scores  
**Risk classification:** Low / Moderate / High / Critical

## 7. Dependencies and Prerequisites

- Required approvals
- Backups or exports
- Administrative access
- Vendor availability
- Maintenance window
- Monitoring availability
- Communication completion
- Test environment results

## 8. Implementation Plan

1. Record the current configuration and health baseline.
2. Confirm approvals and maintenance window.
3. Notify stakeholders that implementation is starting.
4. Execute each technical step in sequence.
5. Record command output, screenshots, or logs as evidence.
6. Run post-change validation.
7. Notify stakeholders of the result.
8. Update the change record and close or initiate rollback.

## 9. Validation Plan

| Test | Expected Result | Evidence |
|---|---|---|
| Service health | Service available and stable | Monitoring output |
| Functional test | Intended function works | Test result |
| User test | Representative user completes task | Confirmation |
| Security test | Access and controls remain correct | Audit output |
| Performance test | No unacceptable degradation | Baseline comparison |

## 10. Rollback Plan

### Rollback Trigger

Define measurable conditions that require rollback.

### Rollback Steps

1. Stop implementation activity.
2. Notify the Change Manager and Service Owner.
3. Restore the prior configuration or backup.
4. Restart or refresh affected services.
5. Validate service recovery.
6. Document the failure point and evidence.
7. Create or link an incident if service impact occurred.

### Estimated Rollback Time

Document the expected recovery duration.

## 11. Communication Plan

| Audience | Message | Channel | Timing | Owner |
|---|---|---|---|---|
| End users | Planned impact and support instructions | Email / portal | Before change | Change Owner |
| Service desk | Known symptoms and escalation path | Team channel | Before change | Change Manager |
| Leadership | Risk, schedule, and outcome | Status report | Before and after | Service Owner |

## 12. Approvals

| Role | Decision | Name | Date | Notes |
|---|---|---|---|---|
| Change Owner | Ready |  |  |  |
| Service Owner | Approve / Reject |  |  |  |
| Security Reviewer | Approve / Not Required |  |  |  |
| CAB Chair | Approve / Reject |  |  |  |

## 13. Implementation Log

| Time | Action | Result | Performed By |
|---|---|---|---|
| HH:MM | Step performed | Successful / failed | Name |

## 14. Post-Implementation Review

| Question | Response |
|---|---|
| Was the objective achieved? |  |
| Was the change completed within the window? |  |
| Did any incident occur? |  |
| Was rollback required? |  |
| Were users affected unexpectedly? |  |
| What evidence confirms success? |  |
| What should be improved next time? |  |

## 15. Closure

| Field | Value |
|---|---|
| Final Status | Successful / Successful with Issues / Failed / Backed Out |
| Closed By |  |
| Closure Date |  |
| Evidence Location |  |
| Follow-Up Actions |  |
