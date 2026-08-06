# INC-1057 — Duplicate Proxy Address Conflict

**Severity:** P3  
**Status:** Resolved

## Summary
A new-hire account failed cloud export because `smtp:alex.morgan@northstarlab.com` remained on a disabled contractor object.

## Investigation
The duplicate-attribute script identified two objects with the same lowercase proxy address. HR and the hiring manager confirmed the new employee was the authoritative recipient.

## Resolution
Removed the obsolete address from the disabled contractor object, documented the ownership decision, ran a delta synchronization, and validated mail routing and sign-in for the new employee.

## Prevention
The onboarding pre-check now scans UPN, mail, and proxy addresses before account activation.
