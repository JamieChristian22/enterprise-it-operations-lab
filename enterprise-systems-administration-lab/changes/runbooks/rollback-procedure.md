# Rollback Procedure

Rollback is initiated when a validation checkpoint fails, service health degrades, the implementation exceeds the approved window, or unexpected security impact occurs.

## Steps
1. Stop implementation.
2. Notify CAB Chair and Service Desk.
3. Restore previous configuration, snapshot, GPO link state, DNS record, or package version.
4. Restart affected services when required.
5. Re-run baseline validation.
6. Confirm user impact is resolved.
7. Mark the change Backed Out and open a PIR.
