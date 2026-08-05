# Active Directory Operations Runbook

## Severity and Priority

| Priority | Definition | Target Response | Target Resolution |
|---|---|---:|---:|
| P1 | Broad authentication outage or security incident | 15 minutes | 4 hours |
| P2 | Multiple users or critical role blocked | 30 minutes | 8 hours |
| P3 | Single-user access issue | 4 business hours | 2 business days |
| P4 | Planned request or low-impact change | 1 business day | 5 business days |

## Identity Verification Standard

Before resetting a password, unlocking an account, changing MFA information, or granting access, verify the requestor using two approved attributes or manager confirmation. Never use information supplied only within an untrusted email as the sole verification source.

Approved methods:

- Manager confirmation from the corporate directory
- Employee ID plus callback to a registered phone
- In-person badge verification
- Existing authenticated support portal session plus one secondary attribute

## New-Hire Onboarding Procedure

1. Confirm approved HR ticket with start date, manager, department, title, and required access.
2. Check for duplicate names and naming conflicts.
3. Create the account in the correct department OU.
4. Set a temporary password and require change at first sign-in.
5. Assign baseline and role-based groups.
6. Create a home directory.
7. Confirm manager and department attributes.
8. Test access with a nonprivileged validation account or group membership query.
9. Record completion and exceptions in the ticket.
10. Deliver credentials through an approved secure channel; never place the password in the ticket.

## Password Reset Procedure

1. Verify identity.
2. Check whether the account is disabled, expired, or locked.
3. Review recent lockout events where appropriate.
4. Reset to a temporary password.
5. Force password change at next sign-in.
6. Unlock only after confirming no suspicious activity.
7. Ask the user to update stored credentials on mobile devices, mapped drives, scheduled tasks, and VPN clients.
8. Document the verification method and outcome without recording the password.

## Account Unlock Procedure

```powershell
Search-ADAccount -LockedOut | Select-Object Name,SamAccountName
Unlock-ADAccount -Identity <samAccountName>
```

Investigate repeated lockouts before repeatedly unlocking. Common causes include stale mobile credentials, Windows Credential Manager, mapped drives, services, scheduled tasks, and remote sessions.

## Access Request Procedure

1. Confirm data owner or manager approval.
2. Identify the correct role group.
3. Do not grant direct NTFS permissions to a user.
4. Add the user to the approved global role group.
5. Verify nested membership and effective access.
6. Record approver, group, business reason, and test result.

## Offboarding Procedure

1. Confirm HR approval and effective time.
2. Export current attributes and group memberships.
3. Disable the account.
4. Reset the password to a random value not shared with anyone.
5. Remove nonrequired group memberships.
6. Revoke active sessions/tokens in connected systems where applicable.
7. Transfer data ownership according to policy.
8. Move the account to the Disabled Users OU.
9. Set description with ticket number and date.
10. Retain for 90 days before deletion, unless legal hold applies.

## Emergency Disable Procedure

For suspected compromise or urgent termination:

```powershell
Disable-ADAccount -Identity <samAccountName>
Set-ADAccountPassword -Identity <samAccountName> -Reset -NewPassword (Read-Host -AsSecureString)
```

Then escalate to security, preserve logs, record the exact time, and do not delete the account.

## Group Change Standard

- Use descriptive group names.
- Keep business-role groups separate from resource-permission groups.
- Document owner and purpose in the group description.
- Review privileged and sensitive groups monthly.
- Remove stale nested memberships.

## Escalation Triggers

Escalate when:

- A domain controller is unavailable.
- Replication or DNS is failing.
- An account appears compromised.
- A privileged group change is unauthorized.
- A user requests access without an approver.
- Permission inheritance is unexpectedly broken.
- A GPO change affects a broad scope.
