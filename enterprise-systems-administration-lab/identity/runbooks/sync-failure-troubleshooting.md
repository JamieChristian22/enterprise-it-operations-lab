# Runbook — Synchronization Failure Troubleshooting

## Triage
1. Capture the exact connector, run profile, time, error code, and affected object count.
2. Determine whether the issue affects import, synchronization, export, or password hash synchronization.
3. Preserve connector-space and event-log evidence before restarting services.

## Decision Path
- **Duplicate attribute:** run `Find-DuplicateIdentityAttributes.ps1`, identify the authoritative object, correct the invalid attribute, and resynchronize.
- **Permission error:** validate connector credentials, account status, and directory permissions.
- **Stopped extension:** inspect detailed stack data and recent synchronization-rule changes.
- **Deletion threshold:** stop and validate scope changes before authorizing deletion continuation.
- **Network or service issue:** test name resolution, HTTPS connectivity, proxy, TLS, service state, and time synchronization.

## Controlled Retry
Use `Start-ADSyncSyncCycle -PolicyType Delta` only after the cause is corrected. Do not repeatedly trigger cycles without understanding the failure.

## Closure Evidence
Attach before-and-after connector status, corrected attributes, successful cycle output, affected-user validation, and the final incident timeline.
