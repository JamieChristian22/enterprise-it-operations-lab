# Bare-Metal Server Recovery Runbook

1. Confirm hardware or VM specifications match the protected workload.
2. Boot from Windows recovery media.
3. Connect only to the isolated recovery network.
4. Locate the approved bare-metal recovery image.
5. Restore critical volumes and boot configuration.
6. Install missing storage or network drivers if required.
7. Start Windows and review boot, disk, service, and event-log health.
8. Apply current security updates after restoration.
9. Validate application functionality and data consistency.
10. Obtain owner acceptance before production reconnection.
