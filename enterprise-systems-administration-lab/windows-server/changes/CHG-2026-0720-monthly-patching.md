# CHG-2026-0720 — July Windows Server Patching

- **Status:** Completed
- **Owner:** Jamie Christian, Systems Administrator
- **Window:** July 20, 2026, 22:00–23:42 ET
- **Risk:** Medium

## Scope

Install approved July 2026 Windows Server cumulative and security updates on all four lab servers.

## Pre-Checks

All servers passed health checks, latest backup age was 3.8 hours, no pending reboot existed, disk free space exceeded 30%, and service state was recorded.

## Execution

Patched NSS-APP01, NSS-PRINT01, NSS-FILE01, and NSS-DC01 in sequence. Rebooted each host and completed role-specific validation before proceeding.

## Validation

DNS resolution, domain authentication, SMB access, test printing, HTTPS application access, firewall state, and required services passed. No new critical events were observed during the 30-minute monitoring period.

## Rollback

Uninstall the identified update only if a reproducible update-related failure occurs, then restore the latest recovery point if package rollback fails.

## Result

Completed successfully. Four of four servers compliant.
