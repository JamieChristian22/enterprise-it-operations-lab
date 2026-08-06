# Runbook: Account Lockout

1. Verify the caller and authorization.
2. Inspect `passwd -S <user>` and `chage -l <user>`.
3. Review recent authentication failures.
4. Confirm the account is not intentionally disabled.
5. Unlock only after validation: `sudo passwd -u <user>`.
6. Rotate credentials or SSH keys when compromise is suspected.
7. Validate access without granting additional groups.
8. Record the action in the ticket.
