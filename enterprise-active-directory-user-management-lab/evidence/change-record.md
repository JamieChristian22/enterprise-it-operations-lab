# Change Record — Active Directory Lab Deployment

| Field | Value |
|---|---|
| Change ID | CHG-2026-1011 |
| Owner | Jamie Christian |
| Date | August 5, 2026 |
| Risk | Medium |
| Systems | DC01, FS01, CL01 |
| Business reason | Standardize identity, access, and workstation controls |
| Approval | Lab Change Authority — Approved |

## Implementation

1. Back up current GPOs.
2. Create OU and group structures.
3. Import sample users.
4. Configure group nesting.
5. Create SMB shares and NTFS permissions.
6. Pilot workstation policies.
7. Validate access and policy behavior.
8. Export audit reports.

## Risk Controls

- Pilot deployment before broad policy link
- `-WhatIf` for supported scripts
- Membership export before offboarding
- No direct user ACLs
- GPO backup before changes
- Validation report after implementation

## Rollback

Disable new GPO links, restore GPO backups, remove lab-only group nesting, restore prior ACL export, and revert lab VM checkpoints only if directory-level rollback is required.

## Result

Successful. All fifteen acceptance tests passed. No unauthorized access was observed.
