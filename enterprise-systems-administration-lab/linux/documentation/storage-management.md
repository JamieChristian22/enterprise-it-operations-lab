# Storage Management

## Standard Checks

```bash
lsblk -o NAME,SIZE,FSTYPE,MOUNTPOINTS,UUID
findmnt
df -hT
df -i
sudo du -xhd1 /var | sort -h
```

## New Filesystem Procedure

```bash
sudo mkfs.ext4 /dev/sdb1
sudo mkdir -p /srv/archive
sudo blkid /dev/sdb1
```

Add the UUID to `/etc/fstab`:

```text
UUID=11111111-2222-3333-4444-555555555555 /srv/archive ext4 defaults,nofail 0 2
```

Validate safely:

```bash
sudo mount -a
findmnt /srv/archive
sudo touch /srv/archive/write-test
sudo rm /srv/archive/write-test
```

## High Disk Usage Response

1. Confirm filesystem and inode usage.
2. Identify top-level growth.
3. Check logs, deleted-open files, caches, and old backups.
4. Free space using an approved action.
5. Determine why retention or rotation failed.
6. Validate application and backup services.
