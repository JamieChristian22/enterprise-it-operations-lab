# INC-002 — User Could Open Shared Mailbox but Could Not Send

**Severity:** Medium

## Cause
The user had Full Access but did not have Send As permission.

## Resolution
The approved Send As permission was assigned using `Add-RecipientPermission`.

## Validation
The user successfully sent a message from the shared mailbox and the sent item was verified.

## Prevention
The shared-mailbox request form now separates Full Access, Send As, and Send on Behalf.
