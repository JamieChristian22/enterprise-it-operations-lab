# Restore Test Record — BRT-2026-007

**Resource:** `orders-prod-db`  
**Platform:** AWS RDS for PostgreSQL  
**Test date:** 2026-07-18  
**Operator:** Jamie Christian  
**Approver:** Database Platform Lead  
**Scenario:** Accidental deletion of order records detected at 09:52 UTC.

## Recovery details

| Field | Result |
|---|---|
| Approved recovery timestamp | 2026-07-18 09:40 UTC |
| Latest restorable time at test start | 2026-07-18 10:02 UTC |
| Restore started | 2026-07-18 10:05 UTC |
| Database available | 2026-07-18 10:34 UTC |
| Application validation complete | 2026-07-18 10:41 UTC |
| Actual RPO | 12 minutes |
| Actual RTO | 36 minutes |
| Target | RPO 15 minutes / RTO 2 hours |
| Outcome | Passed |

## Validation results

- Restored instance: `orders-prod-db-restore-20260718`.
- Encryption key matched the approved backup KMS alias.
- Public accessibility was disabled.
- Security group permitted PostgreSQL only from the recovery validation host.
- `orders` row count matched the 09:40 control export: 2,481,776 rows.
- Maximum `created_at` value was 2026-07-18 09:39:57 UTC.
- Financial transaction total differed by 0.00 from the control report.
- Application login, order lookup, and test-order submission passed.
- CloudWatch logs, Performance Insights, and alarms were active.

## Cleanup

The temporary instance was retained for seven days under change `CHG-2026-0148`, then deleted after evidence approval. The source instance was not modified during the exercise.
