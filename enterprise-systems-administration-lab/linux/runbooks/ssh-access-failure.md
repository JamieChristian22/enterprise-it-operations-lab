# Runbook: SSH Access Failure

1. Confirm source address, username, and exact error.
2. Test reachability and TCP port 22.
3. Confirm `ssh.service` is active.
4. Review UFW rules.
5. Review `/var/log/auth.log` and the SSH journal.
6. Validate account lock, expiration, shell, group membership, and key permissions.
7. Run `sshd -t` before any restart.
8. Test with `ssh -vvv`.
9. Never enable root or broad password authentication as a shortcut.
