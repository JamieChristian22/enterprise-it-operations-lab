# Backup Restore Validation

- Recovery point: `northstar-postgres-2026-08-05T05:03Z`
- Restore target: isolated `northstar-restore-test` database
- Restore duration: 18 minutes
- Integrity check: 25,000 order rows and 3,200 customer rows matched expected counts
- Application smoke test: read-only order lookup returned HTTP 200
- Cleanup: temporary database deleted after validation
- Result: **PASS**
- Performed by: Jamie Christian II
- Date: 2026-08-06
