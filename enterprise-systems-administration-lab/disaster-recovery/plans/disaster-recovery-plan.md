# Disaster Recovery Plan

## Purpose
Restore critical infrastructure services after a declared disaster while protecting data integrity, maintaining command control, and meeting approved recovery objectives.

## Activation Criteria
The Incident Commander may declare disaster recovery when any of the following occurs:
1. Primary virtualization cluster is unavailable for more than 20 minutes.
2. Backup integrity is confirmed but production restoration cannot meet service targets in place.
3. Ransomware or destructive malware affects production identity, storage, or backup management planes.
4. Primary site power, network, cooling, or physical access is expected to be unavailable for more than 60 minutes.
5. Two or more Tier 0/Tier 1 services are simultaneously unavailable with no safe local recovery path.

## Command Structure
- Incident Commander: Infrastructure Manager
- Recovery Coordinator: Senior Systems Administrator
- Identity Lead: Active Directory Administrator
- Network Lead: Network Engineer
- Application Lead: Systems Engineer
- Security Lead: Security Analyst
- Communications Lead: Service Delivery Manager
- Recorder: Change Coordinator

## Recovery Phases
1. Detect and classify
2. Declare and mobilize
3. Stabilize and isolate
4. Validate backups and recovery site
5. Restore Tier 0 services
6. Restore Tier 1 services
7. Restore Tier 2 services
8. Validate business operation
9. Communicate service restoration
10. Transition to normal operations
11. Conduct post-incident review

## Recovery Order
1. Recovery-site networking and storage
2. Domain controller and DNS
3. DHCP
4. Backup catalog and recovery console
5. File services
6. SQL database and application services
7. IIS intranet
8. Monitoring and alerting

## Exit Criteria
- All Tier 0 and Tier 1 services pass validation.
- Data loss remains within approved RPO.
- Users can authenticate and access critical applications.
- Monitoring is restored.
- Business owner accepts service restoration.
- Incident Commander authorizes transition to normal operations.
