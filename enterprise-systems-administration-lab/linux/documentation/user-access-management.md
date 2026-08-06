# User Access Management

## Access Model

| Role | Group | Access |
|---|---|---|
| Linux administrator | `linux-admins` | Approved administrative commands through sudo |
| Help desk analyst | `helpdesk-linux` | Read-only diagnostics and limited account operations |
| Standard employee | Department group | No administrative rights |

## Provisioning Procedure

1. Confirm the approved username and manager.
2. Create the account with a home directory.
3. Add only approved groups.
4. Install the user's public SSH key with secure permissions.
5. Require password change at first sign-in when password authentication is used locally.
6. Validate access and record the result.

```bash
sudo bash scripts/create-linux-user.sh jcarter "Jamie Carter" linux-admins /tmp/jcarter.pub
id jcarter
sudo -l -U jcarter
```

## Offboarding Procedure

1. Lock the account immediately.
2. Terminate active sessions.
3. preserve the home directory in a restricted archive.
4. Remove scheduled jobs and application credentials.
5. Remove the account after retention approval.

```bash
sudo bash scripts/disable-linux-user.sh jcarter
sudo loginctl terminate-user jcarter
```

## Quarterly Access Review

```bash
getent group linux-admins
getent group helpdesk-linux
awk -F: '$3 >= 1000 {print $1,$3,$7}' /etc/passwd
sudo grep -R "^[^#].*ALL" /etc/sudoers /etc/sudoers.d
```
