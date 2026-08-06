# INC-004 — Revoked Certificate Still Accepted

## Cause
The application cached revocation data and did not refresh after CRL publication.

## Resolution
The application service was restarted and OCSP validation was enabled.

## Prevention
Documented cache behavior and added revocation testing to deployment validation.
