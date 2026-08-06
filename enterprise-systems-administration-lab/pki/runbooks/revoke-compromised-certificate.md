# Runbook: Revoke Compromised Certificate

1. Verify the compromise and certificate identity.
2. Record serial number, thumbprint, owner, and application.
3. Revoke with reason `KeyCompromise`.
4. Publish a new CRL.
5. Confirm OCSP reflects revoked status.
6. Replace the certificate and key.
7. Investigate scope of compromise.
