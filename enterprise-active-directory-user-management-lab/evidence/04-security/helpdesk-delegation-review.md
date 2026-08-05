# Help Desk Delegation Review

## Tier 1 Allowed
- Reset passwords
- Unlock accounts
- Read standard user attributes
- Update telephone and office fields

## Tier 1 Denied
- Create privileged accounts
- Modify Domain Admins
- Edit GPOs
- Change OU ACLs
- Delete protected accounts

## Test Results
| Test | Expected | Observed | Result |
|---|---|---|---|
| Reset standard user password | Allowed | Allowed | PASS |
| Unlock standard user | Allowed | Allowed | PASS |
| Add user to Domain Admins | Denied | Denied | PASS |
| Edit GPO | Denied | Denied | PASS |
| Delete admin account | Denied | Denied | PASS |

Delegation matched least-privilege requirements.
