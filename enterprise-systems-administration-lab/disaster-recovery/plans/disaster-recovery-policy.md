# Disaster Recovery Policy

- Recovery plans are reviewed quarterly and after material infrastructure changes.
- Tier 0 and Tier 1 services must have tested recovery procedures.
- Backup copies must follow a 3-2-1-1-0 model.
- At least one recovery copy must be immutable and isolated from production credentials.
- Restore testing occurs monthly for files, quarterly for servers, and annually for full-service scenarios.
- RTO and RPO breaches require a corrective action and management review.
- Recovery access uses separate privileged accounts protected by MFA.
- All exercises produce evidence, lessons learned, and assigned remediation actions.
