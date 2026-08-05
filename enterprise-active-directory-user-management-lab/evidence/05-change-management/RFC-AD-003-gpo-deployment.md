# RFC-AD-003 — Group Policy Baseline Deployment

## Business Justification
Standardize workstation security, auditing, drive mappings, and Windows Update behavior.

## Risk
Medium. Incorrect scope could affect all domain-joined workstations.

## Implementation Plan
1. Back up existing GPOs.
2. Create GPOs in an unlinked state.
3. Configure settings.
4. Link to test OU.
5. Validate on CL01.
6. Expand to production-style OU.
7. Run `gpupdate /force` and review `gpresult`.

## Rollback Plan
1. Disable the GPO link.
2. Restore prior GPO backup if required.
3. Run `gpupdate /force`.
4. Confirm removed settings on CL01.

## Validation
All six GPOs applied as designed. No unexpected policies were detected.

## Approval
- Requestor: Jamie Christian
- Technical reviewer: Lab Administrator
- Status: Approved and Closed
