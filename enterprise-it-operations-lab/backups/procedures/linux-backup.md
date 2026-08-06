# Linux Backup Procedure

## Scope

- `/etc`
- Application configuration
- Databases or database dumps
- User and service data
- Automation and deployment files

## Example

```bash
tar --xattrs --acls -czf /backup/etc-$(date +%F).tar.gz /etc
sha256sum /backup/etc-$(date +%F).tar.gz > /backup/etc-$(date +%F).sha256
```

## Validation

- Archive opens
- Checksum matches
- Ownership and permissions preserved
- Restore tested in isolated path
