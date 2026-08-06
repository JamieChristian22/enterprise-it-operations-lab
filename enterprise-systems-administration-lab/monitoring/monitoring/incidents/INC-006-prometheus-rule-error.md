# INC-006 — Prometheus Rule Evaluation Failures

**Severity:** Medium

## Cause
A recording rule referenced a renamed metric after an exporter update.

## Resolution
The metric name was corrected and rules passed `promtool check rules`.

## Validation
Rule failures stopped increasing and dashboard panels recovered.
