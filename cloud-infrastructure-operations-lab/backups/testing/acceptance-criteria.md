# Restore Test Acceptance Criteria

A restore test passes only when:

- The selected recovery point is within the workload RPO.
- Restore duration is within RTO or has an approved exception.
- Encryption, network restrictions, identities, logging, and monitoring are preserved.
- Critical filesystem, database, and application-integrity checks pass.
- The service owner completes a user-level transaction or equivalent functional test.
- The restored resource is assigned to an active backup policy before closure.
- Temporary resources, credentials, routes, and firewall rules are removed.
- Evidence includes job identifiers, timestamps, commands, results, approvals, and final disposition.
