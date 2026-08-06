# INC-002 — Administrator Unable to Sign In by SSH

**Severity:** Medium

## Symptom
A newly provisioned administrator received `Permission denied (publickey)`.

## Investigation
The account and group were correct. `sshd` logs reported that `authorized_keys` had insecure permissions. The file mode was `0644` and `.ssh` was `0755`.

## Resolution
Permissions were corrected to `0700` for `.ssh` and `0600` for `authorized_keys`, with ownership assigned to the user.

## Validation
Key-based login succeeded and password authentication remained disabled.

## Prevention
The provisioning script now uses `install` with explicit owner and mode values.
