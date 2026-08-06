# Runbook: Prometheus Rule Evaluation Failure

1. Check Prometheus logs.
2. Run `promtool check rules`.
3. Identify missing metrics, syntax errors, or expensive queries.
4. Correct the rule.
5. Reload configuration.
6. Confirm evaluation failures stop increasing.
