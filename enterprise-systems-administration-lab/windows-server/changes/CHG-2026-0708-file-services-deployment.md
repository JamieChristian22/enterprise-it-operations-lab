# CHG-2026-0708 — Department File Services Deployment

- **Status:** Completed
- **Owner:** Jamie Christian, Systems Administrator
- **Window:** July 8, 2026, 19:00–20:30 ET
- **Risk:** Medium

## Business Reason

Replace unmanaged local folders with centrally controlled SMB shares for Finance, HR, Operations, and all employees.

## Implementation

Installed File Server and FSRM roles, created `D:\Shares`, provisioned four department shares, applied group-based NTFS permissions, enabled access-based enumeration, disabled offline caching, and configured quotas.

## Pre-Checks

Server health passed, backup completed at 18:15, groups existed, and port 445 was reachable from the test client.

## Validation

Read/write users created and modified files; read-only users could open but not modify; unauthorized users could not enumerate restricted shares; Pester required-file tests passed.

## Rollback

Remove SMB shares without deleting data, restore pre-change ACL exports, uninstall FSRM if required, and return users to the prior storage path.

## Result

Completed successfully with no user-impacting errors.
