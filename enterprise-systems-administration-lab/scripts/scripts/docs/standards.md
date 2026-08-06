# Automation Development Standard

Every administrative script should implement parameter validation, dependency checks, logging, structured outputs, safe failure behavior, and documented examples.

## Exit Codes

| Code | Meaning |
|---|---|
| 0 | Success |
| 1 | Operational failure |
| 2 | Validation failure |
| 64 | Invalid usage |
| 66 | Missing input |
| 69 | Missing dependency |
| 77 | Insufficient privileges |
