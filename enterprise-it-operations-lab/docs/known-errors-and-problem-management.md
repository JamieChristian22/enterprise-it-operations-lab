# Known Errors and Problem Management

**Owner:** Problem Management  
**Version:** 1.0

## Purpose
Identify recurring incidents, document reliable workarounds, remove root causes, and reduce repeated support effort.

## Problem creation triggers
Create a problem record when:
- The same incident occurs three or more times in 30 days.
- A P1 or major P2 incident occurs.
- A workaround is repeatedly used.
- Monitoring detects a persistent reliability trend.
- A failed change reveals a systemic weakness.

## Problem workflow
1. Link related incidents.
2. Define the problem statement.
3. Quantify frequency and impact.
4. Collect logs, timelines, and changes.
5. Identify root cause and contributing factors.
6. Publish a known error when a workaround exists.
7. Plan a permanent corrective change.
8. Validate that recurrence has stopped.
9. Close with measurable evidence.

## Known error records
### KE-001 — DNS client points to public resolver
**Symptoms:** Domain sign-in delays, failed group-policy processing, and inability to resolve `northstar.lab`.  
**Cause:** Client network adapter configured with a public DNS server instead of the domain DNS server.  
**Workaround:** Set the preferred DNS server to `NS-DC01`, clear the resolver cache, and renew registration.  
**Validation:** `nslookup northstar.lab`, `nltest /dsgetdc:northstar.lab`, and `gpupdate /force` succeed.  
**Permanent action:** Enforce DHCP scope options and configuration compliance.

### KE-002 — Disk alert caused by retained temporary logs
**Symptoms:** Server disk utilization exceeds 85%, application writes slow, and monitoring enters warning state.  
**Cause:** Temporary diagnostic logs retained beyond the intended period.  
**Workaround:** Archive required logs and safely remove expired temporary files.  
**Validation:** Disk utilization falls below 75% and the application writes successfully.  
**Permanent action:** Configure log rotation and weekly capacity checks.

### KE-003 — Intune policy conflict
**Symptoms:** Endpoint remains noncompliant after sync.  
**Cause:** Two configuration profiles apply conflicting settings.  
**Workaround:** Review device configuration status, remove the pilot device from the conflicting assignment, sync, and re-evaluate.  
**Validation:** Device reports compliant after policy refresh.  
**Permanent action:** Maintain a policy assignment matrix and require peer review for overlapping settings.

### KE-004 — EC2 status alarm after application service failure
**Symptoms:** Host passes system checks but application health check fails.  
**Cause:** Application service stopped after configuration error.  
**Workaround:** Review logs, correct the configuration, restart the service, and validate the endpoint.  
**Validation:** Service is active and monitoring returns to OK.  
**Permanent action:** Add configuration validation before restart and an automated service-health check.

## Root-cause techniques
- Five Whys
- Timeline analysis
- Change correlation
- Fault-tree analysis
- Configuration comparison
- Trend and frequency analysis

## Closure criteria
A problem closes when the root cause is understood or risk is formally accepted, corrective actions are complete, monitoring shows no recurrence for the defined observation period, and linked knowledge is updated.
