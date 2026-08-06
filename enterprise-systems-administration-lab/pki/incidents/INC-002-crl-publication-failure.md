# INC-002 — CRL Publication Failure

## Impact
Clients could not complete revocation checking.

## Cause
The HTTP publication folder permissions had been changed during web server hardening.

## Resolution
Permissions were corrected, a new CRL was published, and client retrieval was validated.

## Prevention
Added CRL URL checks to daily PKI health validation.
