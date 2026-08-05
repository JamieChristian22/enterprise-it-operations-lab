# TKT-2026-145 — Outlook Authentication Prompt

## Issue Summary

Finance user Maya Thompson received repeated Outlook authentication prompts and could not send email from the desktop client.

## Environment

- Device: LT-FIN-022
- OS: Windows 11 Pro
- Application: Microsoft Outlook
- Service: Microsoft 365
- Workaround: Outlook on the web

## Troubleshooting Performed

1. Confirmed Outlook on the web worked.
2. Verified Microsoft 365 service health was normal.
3. Confirmed the user account was enabled and licensed.
4. Removed stale credentials from Windows Credential Manager.
5. Refreshed the user's Microsoft 365 sign-in token.
6. Reopened Outlook and tested send/receive.

## Root Cause

The endpoint retained a stale authentication token after an identity policy update.

## Resolution

Cached credentials were removed and the Microsoft 365 token was refreshed.

## Validation

The user sent and received test messages successfully and confirmed normal Outlook operation.

## Closure

Resolved on 2026-07-27 at 11:14 ET. Knowledge article KB-2026-019 was used.
