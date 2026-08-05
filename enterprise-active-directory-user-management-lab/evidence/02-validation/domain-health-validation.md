# Domain Health Validation

**Date:** 2026-08-05  
**Domain:** `corp.contoso.local`  
**Domain Controller:** `DC01`

## Checks Performed

| Check | Command | Expected | Observed | Result |
|---|---|---|---|---|
| AD DS service | `Get-Service NTDS` | Running | Running | PASS |
| DNS service | `Get-Service DNS` | Running | Running | PASS |
| SYSVOL share | `net share` | SYSVOL present | Present | PASS |
| NETLOGON share | `net share` | NETLOGON present | Present | PASS |
| DC diagnostics | `dcdiag /q` | No errors | No errors returned | PASS |
| Replication summary | `repadmin /replsummary` | 0 failures | 0 failures | PASS |
| Secure channel | `nltest /sc_verify:corp.contoso.local` | Trusted DC found | Trusted DC found | PASS |

## Conclusion
The domain controller passed all health and service validation checks.
