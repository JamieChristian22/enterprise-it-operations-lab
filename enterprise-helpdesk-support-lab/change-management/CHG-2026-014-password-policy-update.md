# CHG-2026-014 — Domain Password Policy Update

## 1. Record Control

| Field | Value |
|---|---|
| Change Type | Normal |
| Status | Closed — Successful |
| Requested By | Security Operations Lead |
| Change Owner | Jamie Christian II, IT Support Administrator |
| Service Owner | Infrastructure Services Manager |
| Related Record | PRB-2026-006 Weak Password Control Review |
| Date Submitted | 2026-07-06 |
| Planned Window | 2026-07-10 20:00–21:00 ET |
| Actual Window | 2026-07-10 20:03–20:38 ET |

## 2. Executive Summary

The default domain password policy was updated to increase minimum password length from 10 to 14 characters, retain password history for 24 passwords, and maintain a 90-day maximum password age. The change addressed a documented control gap while preserving account availability and existing user passwords.

## 3. Business Justification

An internal access-control review found that the existing minimum password length did not meet the lab organization’s revised security baseline. Updating the policy reduced password-guessing risk and standardized domain authentication requirements.

## 4. Scope

### In Scope

- `corp.example` default domain password policy
- Domain users governed by the default policy
- Help Desk password-reset procedures
- Password policy knowledge article

### Out of Scope

- Service accounts with separate managed credentials
- Fine-grained password policies
- Microsoft Entra ID cloud-only accounts

## 5. Systems Affected

| Configuration Item | Expected Impact |
|---|---|
| DC01 | Group Policy update and replication |
| Domain user accounts | New passwords must meet revised requirements |
| Help Desk procedures | Temporary passwords must be at least 14 characters |

## 6. Risk Assessment

| Factor | Score | Rationale |
|---|---:|---|
| Likelihood of failure | 2 | Standard Group Policy configuration |
| User impact | 3 | Users affected during future password changes |
| Service criticality | 4 | Domain authentication is business critical |
| Rollback complexity | 1 | Prior policy can be restored quickly |
| Security exposure | 3 | Direct authentication-control change |

**Total:** 13  
**Classification:** Moderate

## 7. Dependencies and Prerequisites

- CAB approval completed
- Group Policy backup created
- Current policy exported with `Get-ADDefaultDomainPasswordPolicy`
- Service Desk notification completed
- Test account available
- Domain controller health confirmed

## 8. Implementation Plan

1. Open an elevated PowerShell session on DC01.
2. Export the existing domain password policy.
3. Confirm Active Directory and SYSVOL health.
4. Run:

```powershell
Set-ADDefaultDomainPasswordPolicy `
  -Identity "corp.example" `
  -MinPasswordLength 14 `
  -PasswordHistoryCount 24 `
  -MaxPasswordAge (New-TimeSpan -Days 90) `
  -ComplexityEnabled $true
```

5. Run `gpupdate /force`.
6. Confirm the updated configuration.
7. Reset the designated test account password to a compliant value.
8. Confirm a noncompliant password is rejected.
9. Notify the Service Desk and Security Operations.

## 9. Validation Results

| Test | Expected | Result |
|---|---|---|
| Policy query | Minimum length shows 14 | Passed |
| Compliant password | Accepted | Passed |
| 10-character password | Rejected | Passed |
| Existing authentication | Existing users can sign in | Passed |
| Domain health | No replication or policy errors | Passed |

## 10. Rollback Plan

Rollback trigger: authentication failures, policy corruption, replication errors, or unexpected user lockouts.

```powershell
Set-ADDefaultDomainPasswordPolicy `
  -Identity "corp.example" `
  -MinPasswordLength 10 `
  -PasswordHistoryCount 12 `
  -MaxPasswordAge (New-TimeSpan -Days 90) `
  -ComplexityEnabled $true
```

Estimated rollback time: 15 minutes.

## 11. Approvals

| Role | Decision | Date |
|---|---|---|
| Change Manager | Approved | 2026-07-08 |
| Service Owner | Approved | 2026-07-08 |
| Security Reviewer | Approved | 2026-07-09 |
| CAB Chair | Approved | 2026-07-09 |

## 12. Implementation Log

| Time | Action | Result |
|---|---|---|
| 20:03 | Confirmed approvals and health baseline | Successful |
| 20:08 | Exported existing policy | Successful |
| 20:13 | Applied revised password policy | Successful |
| 20:18 | Forced policy refresh | Successful |
| 20:24 | Tested compliant and noncompliant passwords | Successful |
| 20:31 | Verified authentication and event logs | Successful |
| 20:38 | Sent completion notice | Successful |

## 13. Post-Implementation Review

- Objective achieved: Yes
- Completed within window: Yes
- Unexpected incidents: None
- Rollback required: No
- Evidence retained: Policy export, validation output, event-log review
- Lesson learned: Add the minimum temporary-password length to the Help Desk reset checklist before future policy changes.

## 14. Closure

| Field | Value |
|---|---|
| Final Status | Successful |
| Closed By | Change Manager |
| Closure Date | 2026-07-11 |
| Follow-Up | Updated password-reset SOP and KB article |
