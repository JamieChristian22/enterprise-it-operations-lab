# INC-AD-001 — Repeated Account Lockout

**User:** Taylor Brooks  
**Priority:** Medium  
**Status:** Resolved

## Symptoms
User unlocked twice and was locked again within one minute.

## Investigation
Event 4740 identified caller computer `JC-WS01`. Credential Manager contained an outdated saved credential for a departmental file share.

## Resolution
Removed the stale credential, cleared the mapped session, unlocked the account, and validated successful authentication. No additional 4740 events occurred during the 15-minute observation window.
