# Active Directory Administration Guide

## 1. Environment
The forest and domain use the DNS name `corp.jamiechristian.lab`. `JC-DC01` holds the initial FSMO roles and provides AD DS/DNS. `JC-DC02` provides redundant AD DS/DNS and Global Catalog services. Client computers use only the domain controllers for DNS.

## 2. Administrative Model
Routine administration is performed with separate named administrator accounts. Standard user accounts are not members of privileged groups. Departmental access is assigned through security groups rather than directly to users. Changes to privileged memberships require a change record and a second-person review.

## 3. Identity Lifecycle
New accounts are created from an approved request containing legal name, display name, manager, department, title, start date, required groups, and license/access requirements. Temporary passwords are randomly generated, marked for change at first sign-in, and transmitted through an approved secure channel. Offboarding disables the account first, revokes sessions, removes access groups, transfers ownership, archives required data, and deletes only after retention expires.

## 4. Group Strategy
The environment uses AGDLP: Accounts are members of Global role groups; Global groups are nested into Domain Local resource groups; Domain Local groups receive permissions. Examples: `GG-FIN-Analysts` is nested in `DL-FS-Finance-RW`; `DL-FS-Finance-RW` receives Modify access to the Finance share.

## 5. Group Policy
GPOs are narrowly scoped and named with a function-first convention. Security filtering is used only where necessary. Every change records the previous setting, new setting, test OU, validation result, owner, and rollback action. `gpresult /h` and event logs validate application.

## 6. DNS and Replication
AD-integrated zones allow secure dynamic updates. Domain members point to `JC-DC01` and `JC-DC02`; public resolvers are configured only as DNS forwarders. Replication is checked with `repadmin /replsummary`, `repadmin /showrepl`, Directory Service logs, and SYSVOL/NETLOGON checks.

## 7. FSMO Operations
Role placement is documented and checked monthly. Planned transfers use PowerShell or AD consoles. Seizure is reserved for permanent role-holder loss after recovery options are exhausted. A seized former role holder is never returned to the domain without metadata cleanup and rebuild.

## 8. Service Accounts
Service accounts are non-interactive, purpose-specific, owned, documented, denied local/RDP logon, granted only required rights, and preferably implemented as gMSAs. Password-based service accounts use vaulted long random passwords with rotation and dependency testing.

## 9. Lockout Response
The administrator verifies the user, confirms lockout status, identifies the originating device through DC security events, clears stored credentials or stale sessions, unlocks only after the cause is addressed, and records evidence in the ticket.

## 10. Recovery
System State backups are validated. Non-authoritative restore is used to recover a DC that can receive current data from replication. Authoritative restore is used only for approved object recovery scenarios and is rehearsed in an isolated lab.
