# SEV-2 Incident Drill Result

Scenario: one application target returned HTTP 500 and failed ALB health checks.

1. Alert acknowledged in 3 minutes.
2. Target identified with `describe-target-health`.
3. Instance logs showed a failed service start after configuration change.
4. Configuration reverted through version-controlled automation.
5. Target returned healthy after two checks.
6. Synthetic checkout completed successfully.
7. Total recovery time: 17 minutes.

Result: **RTO objective met; no data loss.**
