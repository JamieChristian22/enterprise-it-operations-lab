# User Lifecycle Validation

| Scenario | Ticket | Key Actions | Result |
|---|---|---|---|
| New hire onboarding | SR-1001 | Create account, assign OU/groups, create home folder | PASS |
| Password reset | INC-1002 | Verify identity, reset password, force change | PASS |
| Account unlock | INC-1003 | Review lockout, unlock, validate sign-in | PASS |
| Department transfer | CHG-1004 | Move OU, update attributes and groups | PASS |
| Leave of absence | SR-1005 | Disable sign-in while retaining access record | PASS |
| Termination | SR-1006 | Disable, remove groups, move OU, retain mailbox data | PASS |
| Rehire | SR-1007 | Re-enable, restore approved access, reset password | PASS |

All lifecycle tests produced expected audit events and were documented in operational logs.
