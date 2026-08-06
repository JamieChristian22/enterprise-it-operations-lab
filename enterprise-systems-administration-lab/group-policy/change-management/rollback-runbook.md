# Group Policy Rollback Runbook

## Trigger conditions

Rollback is initiated for widespread sign-in failures, loss of network connectivity, blocked business applications, unexpected restart behavior, severe performance degradation, or failed acceptance criteria.

## Immediate containment

1. Identify the most recent changed GPO and its links.
2. Disable the affected link rather than deleting the GPO.
3. Preserve current reports and event logs.
4. Move only designated test endpoints to the Pilot OU when isolation is needed.

## Recovery options

- Disable the GPO link.
- Disable only Computer or User Configuration.
- Revert the specific changed setting.
- Restore a known-good backup with `Restore-GPO`.
- Remove an affected Group Policy Preference item.

## Restore example

```powershell
Restore-GPO -Name 'CORP-WS-Security-Baseline-v1.0' `
  -Path 'C:\GPO-Backups\2026-08-05_175500' `
  -Domain 'corp.northstar.local'
```

## Verification

- Run `gpupdate /force`.
- Restart or sign out when the setting requires it.
- Generate a fresh `gpresult /h` report.
- Re-run the validation suite.
- Confirm the business service is restored.
