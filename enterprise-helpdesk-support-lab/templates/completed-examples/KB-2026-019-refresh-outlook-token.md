# Refresh a Stale Outlook Authentication Token

## Audience

Service Desk analysts.

## Symptoms

Outlook repeatedly prompts for credentials, while Outlook on the web works normally.

## Cause

The local endpoint retains stale Microsoft 365 credentials or authentication tokens.

## Resolution

1. Confirm Microsoft 365 service health is normal.
2. Confirm the user account is enabled and licensed.
3. Close Outlook.
4. Open Windows Credential Manager.
5. Remove stale Microsoft Office and ADAL credentials for the affected user.
6. Sign out of the Microsoft 365 desktop applications.
7. Restart the device.
8. Sign in and reopen Outlook.
9. Test send and receive.

## Validation

Outlook opens without repeated prompts and completes a successful send/receive test.

## Escalation

Escalate when Outlook on the web also fails, sign-in logs show policy denial, or multiple users report the same symptom.
