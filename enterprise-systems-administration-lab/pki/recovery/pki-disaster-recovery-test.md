# PKI Disaster Recovery Test

## Scenario

The enterprise Issuing CA was assumed lost.

## Recovery

1. Built a replacement server with the same hostname.
2. Restored CA certificate and private key.
3. Restored CA database.
4. Restored registry configuration.
5. Started Certificate Services.
6. Published a new CRL.
7. Issued and revoked a test certificate.

## Result

Recovery completed successfully in 47 minutes. Existing certificate chains remained valid, enrollment worked, and revocation data was available.
