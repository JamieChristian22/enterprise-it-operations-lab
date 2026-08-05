# File Restore Runbook

1. Validate requester identity, file path, deletion time, and business authorization.
2. Select the newest recovery point preceding the loss.
3. Restore to a staging folder, never directly over production on the first attempt.
4. Validate filename, size, timestamps, permissions, and SHA-256 hash where available.
5. Have the requester confirm content integrity.
6. Copy the validated file to the approved production path.
7. Record recovery point, elapsed time, restored size, and validation result in the ticket.
8. Securely remove staging data after acceptance.
