# PKI Validation Checklist

## Root CA
- [x] Offline and workgroup-based
- [x] 4096-bit RSA key
- [x] SHA-256
- [x] Root certificate and CRL published

## Issuing CA
- [x] Enterprise subordinate CA
- [x] CA service healthy
- [x] Certificate chain valid
- [x] CRL publication scheduled

## Templates
- [x] Approved EKUs
- [x] Enrollment permissions restricted
- [x] Auto-enrollment tested
- [x] Renewal periods configured

## Revocation
- [x] HTTP CDP available
- [x] OCSP available
- [x] Revoked certificate tested

## Recovery
- [x] CA database backup
- [x] Private key backup
- [x] Registry backup
- [x] Recovery test completed
