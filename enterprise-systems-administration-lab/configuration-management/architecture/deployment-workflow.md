# Deployment Workflow

1. Engineer creates a feature branch and updates code plus tests.
2. YAML, PowerShell, and documentation linting run locally.
3. Peer reviewer verifies scope, idempotency, secrets handling, and rollback.
4. Change record is approved for the maintenance window.
5. Pre-change health data is captured.
6. Deployment runs against `lab_canary`, then `lab_servers` in serial batches of two.
7. Validation confirms services, ports, features, registry values, and event logs.
8. A second run confirms idempotency with zero unexpected changes.
9. Evidence and the post-implementation review are attached to the change record.
10. Failed validation triggers the documented rollback procedure.
