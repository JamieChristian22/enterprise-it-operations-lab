# Major Incident Operating Procedure

## Purpose

Provide a repeatable process for restoring service quickly, communicating accurately, preserving evidence, and preventing recurrence.

## Roles

| Role | Responsibility |
|---|---|
| Incident Commander | Owns severity, priorities, timeline, coordination, decisions, and closure |
| Technical Lead | Directs diagnosis, mitigation, recovery, and validation |
| Communications Lead | Publishes stakeholder and service-desk updates |
| Scribe | Records actions, timestamps, evidence, decisions, and owners |
| Service Owner | Confirms business impact, recovery criteria, and corrective actions |
| Vendor Liaison | Opens and manages third-party escalation |
| Security Lead | Leads containment, evidence preservation, and risk decisions for security events |

## Procedure

### 1. Detect and Validate
- Confirm the alert is actionable.
- Check monitoring health to rule out a monitoring failure.
- Record first known impact, detection source, affected service, and initial scope.
- Start MTTD and MTTA clocks.

### 2. Classify and Mobilize
- Assign severity using the severity matrix.
- Create a collaboration bridge for SEV-1/SEV-2.
- Assign the incident commander, technical lead, communications lead, and scribe.
- Freeze nonessential changes to the affected service.

### 3. Stabilize
- Protect users, data, and dependent services.
- Prefer safe mitigation: failover, rollback, isolation, traffic diversion, or capacity relief.
- Record the risk and expected outcome before each material action.
- Maintain a single authoritative timeline.

### 4. Communicate
- Issue the initial notification after impact is confirmed.
- Publish updates every 15 minutes for SEV-1 and every 30 minutes for SEV-2.
- State impact, current action, workaround, next update time, and known risks.
- Never speculate about root cause before evidence supports it.

### 5. Restore and Validate
- Verify system health, service transactions, dependencies, logs, and monitoring.
- Obtain business/user confirmation for critical workflows.
- Monitor for at least one normal operating interval.
- Record the exact restoration time and residual risk.

### 6. Close
- Publish a final resolution notice.
- Link related incidents, changes, vendor cases, knowledge articles, and problem records.
- Schedule an RCA within two business days for every SEV-1, recurring SEV-2, security event, or missed SLA.

### 7. Learn
- Conduct a blameless review.
- Separate trigger, direct cause, root cause, contributing factors, and control failures.
- Create corrective actions with owners, dates, success criteria, and evidence.
- Review overdue actions weekly.

## Required Evidence

- monitoring event or alert identifier;
- relevant logs and command output references;
- change and configuration records;
- vendor case number where applicable;
- validation test results;
- communication timestamps;
- action-item completion evidence.

## Closure Criteria

An incident may close only when:

1. the affected service meets its recovery criteria;
2. monitoring is normal;
3. users or service owners confirm critical workflows;
4. temporary changes and residual risks are documented;
5. follow-up work is assigned;
6. the final communication is issued.
