# Operations Handbook

**Owner:** IT Operations  
**Version:** 2.0  
**Review cycle:** Quarterly

## Daily operations
### 1. Service health review
**Owner:** Operations technician  
**Trigger:** Start of business day

1. Review identity, Microsoft 365, endpoint, server, AWS, and backup dashboards.
2. Check active P1 and P2 incidents.
3. Review failed Windows services and Linux systemd units.
4. Check backup jobs completed during the previous 24 hours.
5. Review endpoint noncompliance and malware detections.
6. Check AWS EC2 status alarms and CloudWatch alerts.

**Pass criteria:** No unexplained critical alarms, failed backup jobs, or unresolved P1/P2 incidents.  
**Evidence:** Daily operations checklist and ticket references.  
**Escalation:** Open or update an incident when a threshold is breached.

### 2. Ticket queue triage
1. Validate category, impact, urgency, and affected service.
2. Assign priority using the severity matrix.
3. Check for duplicates or a known error.
4. Route to the correct owner.
5. Contact the requester when required information is missing.

### 3. Security event review
Review repeated authentication failures, disabled protection controls, unexpected privileged-group changes, and high-severity cloud findings. Escalate any suspected compromise immediately.

## Weekly operations
### Patch and vulnerability review
- Review pending critical and security updates.
- Confirm pilot deployment results.
- Investigate systems outside the patch window.
- Record exceptions with an owner and expiration date.

### Capacity review
- CPU, memory, disk, and network trends.
- Storage growth and projected exhaustion date.
- License consumption and inactive accounts.
- AWS cost anomalies and unused resources.

### Identity hygiene
- Disabled accounts not moved to the correct OU.
- Stale accounts and devices.
- Privileged group membership changes.
- Expiring service-account passwords or credentials.

## Monthly operations
- Publish service-level report.
- Review backup success and restore-test schedule.
- Validate asset inventory against active systems.
- Review alert noise and tune thresholds.
- Review failed changes and recurring incidents.
- Confirm knowledge articles remain accurate.
- Review cloud access, IAM roles, and security-group exposure.

## Quarterly operations
- Complete privileged access review.
- Perform at least one restore test.
- Review business continuity and incident contacts.
- Validate emergency-access accounts.
- Review documentation ownership and stale procedures.
- Conduct a tabletop incident exercise.

## Severity matrix
| Priority | Definition | Acknowledge | Update frequency | Escalation |
|---|---|---:|---:|---|
| P1 | Critical business outage, security incident, or widespread identity failure | 15 min | 30 min | Incident lead and management immediately |
| P2 | Major degradation affecting multiple users or a critical function | 30 min | 60 min | Senior technical owner |
| P3 | Limited impact with workaround available | 4 business hours | Daily | Functional queue owner |
| P4 | Low-impact request, information, or planned work | 1 business day | As agreed | Standard workflow |

## Shift handoff standard
The outgoing technician records:
- Open P1/P2 incidents
- Work completed and current hypothesis
- Pending vendor or user response
- Temporary workaround
- Next checkpoint and owner
- Any monitoring suppression or emergency change still active

## Operational evidence standard
Every completed recurring task records date, technician, result, exception, related ticket, and remediation. A checkbox alone is not sufficient for failed or exceptional results.
