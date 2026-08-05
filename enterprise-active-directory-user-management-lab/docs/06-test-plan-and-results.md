# Test Plan and Results

## Test Environment

- Domain: `corp.northstar.local`
- Domain controller: DC01
- File server: FS01
- Client: CL01
- Test date: August 5, 2026

## Test Cases

| ID | Test | Expected Result | Result |
|---|---|---|---|
| AD-01 | Resolve domain DNS from CL01 | DC01 returns domain records | Pass |
| AD-02 | Authenticate standard user | User signs in with domain account | Pass |
| AD-03 | Verify department OU placement | User exists in correct department OU | Pass |
| AD-04 | New user forced to change password | Prompt appears at first sign-in | Pass |
| AD-05 | Lock and unlock test account | Account unlock restores sign-in | Pass |
| AD-06 | HR user opens HR share | Modify access granted | Pass |
| AD-07 | Sales user opens HR share | Access denied | Pass |
| AD-08 | Finance read-only group opens Finance share | Read succeeds; write denied | Pass |
| AD-09 | Department drive mapping | Correct drive appears after policy refresh | Pass |
| AD-10 | Screen-lock policy | Workstation locks after configured timeout | Pass |
| AD-11 | USB restriction group | Removable storage access denied | Pass |
| AD-12 | Offboarded account signs in | Sign-in denied | Pass |
| AD-13 | Offboarding export | Membership evidence file created | Pass |
| AD-14 | Audit report generation | CSV reports generated without error | Pass |
| AD-15 | Privileged group review | No unauthorized members found | Pass |

## Negative Testing

- Duplicate `samAccountName` is rejected.
- Invalid department is rejected.
- Missing manager account is rejected.
- Direct permission assignment is not used.
- Offboarding without `-ConfirmExecution` does not modify AD.
- Password value is not written to logs.

## Acceptance Criteria

All critical access-control, onboarding, offboarding, and validation tests must pass. No user may access another department’s restricted share unless an approved cross-functional group grants access.
