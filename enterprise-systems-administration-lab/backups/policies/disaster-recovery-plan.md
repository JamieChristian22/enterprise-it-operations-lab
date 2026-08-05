# Disaster Recovery Plan

## Declaration Criteria
Disaster recovery is invoked when normal restoration cannot meet the service RTO, the production site is unavailable, ransomware compromises administrative trust, or multiple critical systems fail simultaneously.

## Roles
- Incident Commander: coordinates decisions and status updates.
- Recovery Lead: directs technical restoration.
- Security Lead: validates containment and credential integrity.
- Service Owners: perform functional acceptance.
- Communications Lead: updates leadership and users.

## Recovery Phases
1. Declare incident and freeze destructive changes.
2. Preserve logs and determine the last known-good recovery point.
3. Establish isolated recovery infrastructure.
4. Restore AD DS/DNS first, followed by file and application services.
5. Validate identity, name resolution, security controls, and business transactions.
6. Obtain service-owner acceptance.
7. Reconnect services in controlled stages.
8. Complete lessons learned and corrective actions within five business days.
