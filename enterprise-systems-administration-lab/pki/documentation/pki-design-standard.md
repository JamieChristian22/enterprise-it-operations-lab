# PKI Design Standard

## Design Principles

- Use a two-tier hierarchy.
- Keep the Root CA offline.
- Use dedicated PKI administrative accounts.
- Publish revocation data over HTTP.
- Separate CA administration from certificate enrollment.
- Limit templates to required EKUs.
- Use auto-enrollment for managed devices and users.
- Back up CA keys, database, registry configuration, and CAPolicy.inf.
- Monitor expiration, failed enrollment, and CRL publication.
- Document all changes to templates and CA configuration.

## Recommended Validity

| Certificate Type | Validity |
|---|---:|
| Root CA | 20 years |
| Issuing CA | 10 years |
| Web Server | 1 year |
| Computer | 1 year |
| User Authentication | 1 year |
| NPS / RADIUS | 1 year |
| OCSP Signing | 2 weeks to 1 month |

## Cryptography

- RSA 4096 for Root CA
- RSA 3072 or 4096 for Issuing CA
- SHA-256 or stronger
- Disable weak hash algorithms
- Protect private keys with strict ACLs and backup encryption
