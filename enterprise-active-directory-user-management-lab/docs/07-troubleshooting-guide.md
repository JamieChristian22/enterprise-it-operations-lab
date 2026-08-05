# Troubleshooting Guide

## User Cannot Sign In

1. Confirm network connectivity and DNS.
2. Verify the username format.
3. Check account state:

```powershell
Get-ADUser <user> -Properties Enabled,LockedOut,AccountExpirationDate,PasswordExpired
```

4. Check lockout status.
5. Confirm workstation time is within Kerberos tolerance.
6. Review domain controller security events.

## Account Keeps Locking

- Review Event ID 4740 on DC01.
- Identify the caller computer.
- Clear stale credentials in Credential Manager.
- Update mobile email/VPN passwords.
- Check services, scheduled tasks, persistent drives, and remote sessions.

## User Cannot Access Shared Folder

1. Confirm the share path resolves.
2. Verify group membership:

```powershell
Get-ADPrincipalGroupMembership <user> | Select-Object Name
```

3. Confirm global group is nested into the correct domain-local group.
4. Review share and NTFS ACLs.
5. Have the user sign out/in to refresh the token.
6. Use `whoami /groups` and `Test-Path` from the client.

## Mapped Drive Missing

- Run `gpupdate /force`.
- Run `gpresult /r`.
- Confirm item-level targeting group.
- Verify the user has a new logon token after membership changes.
- Confirm the UNC path is reachable.

## GPO Not Applying

- Confirm correct OU and link.
- Check security filtering and WMI filtering.
- Confirm inheritance/block inheritance.
- Review `Applications and Services Logs > Microsoft > Windows > GroupPolicy > Operational`.
- Run `gpresult /h` for a complete report.

## PowerShell Script Fails

- Run prerequisite check.
- Confirm module import.
- Confirm current identity and delegated rights.
- Validate CSV headers and encoding.
- Review the latest log entry.
- Use `-WhatIf` where supported.
