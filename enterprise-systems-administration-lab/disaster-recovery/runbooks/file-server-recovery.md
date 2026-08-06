# File Server Recovery Runbook

1. Confirm the selected restore point is malware-free and within RPO.
2. Restore the file-server VM or data volume to isolated recovery storage.
3. Scan restored data before production connection.
4. Validate NTFS permissions and share definitions.
5. Compare critical-folder checksums against the backup catalog.
6. Mount shares using recovery DNS aliases.
7. Test access with finance, operations, and standard-user accounts.
8. Obtain business-owner approval before broad access is enabled.
