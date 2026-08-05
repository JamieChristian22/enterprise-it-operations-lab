# Security and Access Control Design

## Guiding Principles

- Least privilege
- Role-based access
- Group-based authorization
- Separation of duties
- Traceable changes
- Deny by default
- Timely deprovisioning

## AGDLP-Style Model

**Accounts → Global groups → Domain-local groups → Permissions**

Example:

- User `maya.patel`
- Global role group `GG-FIN-Analysts`
- Domain-local resource group `DL-FS-Finance-RW`
- NTFS Modify permission on `D:\Shares\Finance`

No user receives direct folder permissions.

## Group Naming Standard

| Prefix | Meaning | Example |
|---|---|---|
| GG | Global business/role group | `GG-HR-General` |
| DL | Domain-local resource group | `DL-FS-HR-RW` |
| GPO | Policy filtering group | `GPO-USB-Blocked` |
| ADM | Administrative role group | `ADM-HelpDesk-PasswordReset` |

## Permission Matrix

| Resource | Read | Modify | Full Control |
|---|---|---|---|
| HR share | HR staff | HR staff | File server admins only |
| Finance share | Finance auditors | Finance staff | File server admins only |
| Operations share | Approved cross-functional users | Operations staff | File server admins only |
| Sales share | Approved leadership | Sales staff | File server admins only |
| IT share | IT staff | IT administrators | File server admins only |

## Delegated Help Desk Permissions

Help Desk may:

- Reset nonprivileged user passwords
- Force password change at next sign-in
- Unlock nonprivileged user accounts
- Read user and computer attributes

Help Desk may not:

- Modify Domain Admins or equivalent groups
- Reset privileged account passwords
- Edit GPOs
- Change server OU permissions
- Delete users

## Privileged Account Controls

- Separate named admin account
- No shared administrator accounts
- No routine email/web use from privileged sessions
- Stronger password requirements
- Membership review every 30 days
- Administrative action logging

## Service Account Controls

- Purpose and owner documented
- Interactive logon denied
- Minimum required permissions
- Managed service account preferred when supported
- Password rotation or gMSA
- No membership in Domain Admins

## Audit Events of Interest

| Event ID | Meaning |
|---:|---|
| 4720 | User account created |
| 4722 | User account enabled |
| 4725 | User account disabled |
| 4726 | User account deleted |
| 4728/4729 | Member added/removed from global group |
| 4732/4733 | Member added/removed from local group |
| 4740 | Account locked out |
| 4767 | Account unlocked |
| 5136 | Directory object modified |

## Review Cadence

- Daily: failed jobs and urgent lockouts
- Weekly: disabled-account and stale-account review
- Monthly: privileged group membership and sensitive folder access
- Quarterly: all role groups, GPO links, and delegated permissions
