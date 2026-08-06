# sudo Access Control

## Standards

- Grant access through groups.
- Avoid unrestricted `ALL=(ALL) ALL` where possible.
- Use command aliases.
- Enable `use_pty`.
- Log sudo activity.
- Review membership quarterly.

## Example

```text
User_Alias LINUX_ADMINS = %linux-admins
Cmnd_Alias SERVICE_MGMT = /usr/bin/systemctl status *, /usr/bin/systemctl restart *
LINUX_ADMINS ALL=(root) SERVICE_MGMT
Defaults use_pty
```
