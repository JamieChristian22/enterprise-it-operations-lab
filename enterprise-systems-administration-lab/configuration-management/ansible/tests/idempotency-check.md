# Idempotency Check

1. Run `site.yml` against the canary.
2. Record changed tasks.
3. Run the same command again without code changes.
4. Pass when the second run reports zero unexpected changes.

Recorded result: first run changed 17 tasks; second run changed 0 tasks; status PASS.
