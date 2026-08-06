# Runbook: Certificate Chain Error

1. Identify missing or untrusted certificate.
2. Review certificate AIA extensions.
3. Confirm Root and Issuing CA certificates are published.
4. Test HTTP AIA access.
5. Install the required CA certificate only from a trusted source.
6. Revalidate with `certutil -urlfetch -verify`.
