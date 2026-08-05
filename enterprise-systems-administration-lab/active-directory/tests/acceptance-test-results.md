# Acceptance Test Results

| ID | Test | Expected | Result |
|---|---|---|---|
| AD-01 | Resolve domain SRV records | Both DCs returned | Pass |
| AD-02 | Authenticate standard user | Kerberos sign-in succeeds | Pass |
| AD-03 | Failover authentication | Sign-in succeeds with JC-DC01 unavailable in test | Pass |
| AD-04 | Replication summary | Zero failures | Pass |
| AD-05 | SYSVOL/NETLOGON shares | Present on both DCs | Pass |
| AD-06 | New user provisioning | Correct OU/attributes/groups | Pass |
| AD-07 | Unauthorized share | Access denied | Pass |
| AD-08 | Authorized share | Modify succeeds | Pass |
| AD-09 | Help Desk delegation positive | Reset/unlock succeeds | Pass |
| AD-10 | Help Desk delegation negative | User deletion denied | Pass |
| AD-11 | Password minimum | 13-char password rejected | Pass |
| AD-12 | Lockout threshold | Locks at configured threshold | Pass |
| AD-13 | GPO workstation baseline | Required settings applied | Pass |
| AD-14 | Disabled account | Interactive logon denied | Pass |
| AD-15 | Privileged membership audit | Only approved members | Pass |
| AD-16 | DNS secure registration | Client A/PTR registered | Pass |
| AD-17 | FSMO query | Roles match register | Pass |
| AD-18 | Health script | Overall status Healthy | Pass |

**Overall:** 18/18 passed.
