# Ransomware-Aware Recovery

1. Treat the event as a security incident and isolate affected identities, systems, network paths, and replication.
2. Preserve logs and recovery points. Do not restore into the compromised network.
3. Identify a recovery point created before initial compromise, not merely before encryption was discovered.
4. Restore to a clean, isolated recovery environment using trusted identities and known-good images.
5. Scan recovered data and systems, rotate credentials, patch exploited weaknesses, and rebuild rather than trust compromised operating systems.
6. Validate that backup-vault policies, object lock, soft delete, and audit logs were not altered.
7. Reintroduce services in priority order with heightened monitoring.
8. Retain affected and recovered artifacts under incident evidence procedures.
