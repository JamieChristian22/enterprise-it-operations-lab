# CHG-2026-082 — Workstation Security Baseline

| Field | Value |
|---|---|
| Requestor | Jamie Christian |
| Technical owner | Infrastructure Operations |
| Security approver | Security Administration |
| Risk | Medium |
| Planned start | August 5, 2026, 18:00 EDT |
| Planned end | August 5, 2026, 20:00 EDT |
| Target | Pilot Workstations OU, then Standard Workstations OU |

## Reason

Standardize Defender, firewall, UAC, SMB, removable-storage, and local security controls across managed Windows 11 endpoints.

## Implementation

1. Export current GPO inventory and reports.
2. Back up all affected GPOs.
3. Link the baseline to the Pilot Workstations OU.
4. Refresh policy and restart the pilot endpoint.
5. Run the validation suite and complete all test cases.
6. Review Group Policy operational events and endpoint functionality.
7. Link to Standard Workstations after approval.

## Risk and mitigation

The principal risk is application or device incompatibility caused by hardening. The change is isolated in a pilot OU, controls are separated from update policy, and the previous state is backed up.

## Rollback

1. Disable the GPO link on the affected OU.
2. Run `gpupdate /force` and restart endpoints when required.
3. Confirm the baseline no longer appears in `gpresult`.
4. Restore the previous GPO backup if an existing object was modified.
5. Record validation and incident outcomes in the change record.

## Outcome

Pilot validation passed. No critical incident was observed. Production rollout approved in stages.
