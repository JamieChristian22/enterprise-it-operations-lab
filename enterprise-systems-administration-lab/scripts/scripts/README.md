# Enterprise Systems Administration Automation Library

A job-ready automation collection for Active Directory, Microsoft 365, Windows and Linux health, patching, backup, monitoring, PKI, reporting, and validation.

## Engineering Standards

- Safe defaults and explicit parameters
- No hard-coded passwords or API secrets
- `-WhatIf` support for administrative changes
- `set -Eeuo pipefail` for Bash
- Structured CSV or JSON output
- Meaningful exit codes
- Dependency and input validation
- Reusable, documented scripts
- Automated syntax validation in GitHub Actions

## Included Automation

| Area | Examples |
|---|---|
| Active Directory | Health checks, bulk provisioning, lockout evidence |
| Microsoft 365 | License utilization and guest access reviews |
| Patching | Windows update and reboot status, Linux patch reporting |
| Backup | Backup freshness and archive validation |
| Monitoring | Windows capacity and Linux health checks |
| PKI | Certificate expiration reporting |
| Security | Linux user and host audits |
| Reporting | CSV-to-HTML and key/value-to-JSON conversion |
| Analysis | Capacity forecasting |
| Validation | CSV checks and language syntax tests |

## Quick Validation

```bash
bash tests/bash/test-syntax.sh
python3 tests/python/test_python_scripts.py
```

```powershell
./tests/powershell/Test-ScriptSyntax.ps1
```

Use only in an authorized lab or enterprise environment. Review all parameters and run change scripts with `-WhatIf` first.
