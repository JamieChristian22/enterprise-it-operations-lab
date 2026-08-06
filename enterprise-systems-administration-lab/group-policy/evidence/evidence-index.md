# Evidence Index

| Artifact | Purpose |
|---|---|
| `sample-validation-results.csv` | Machine-readable security-control validation |
| `sample-gpresult-summary.txt` | Human-readable RSOP summary for the pilot endpoint |
| `../validation/test-plan.md` | Test cases and outcomes |
| `../validation/acceptance-report.md` | Deployment approval record |
| `../docs/gpo-inventory.csv` | GPO ownership, scope, status, and rollback inventory |
| `../automation/04-export-gpo-evidence.ps1` | Produces native HTML and XML GPO reports in a real domain |
| `../automation/05-collect-client-rsop.ps1` | Produces client-side `gpresult`, event, Defender, firewall, and audit evidence |

The included sample outputs are explicitly labeled as representative lab records. The automation scripts generate environment-native evidence when executed in the configured Active Directory lab.
