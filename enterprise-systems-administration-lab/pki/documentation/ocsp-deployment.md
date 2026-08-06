# OCSP Deployment

## Role Installation

```powershell
Install-WindowsFeature ADCS-Online-Cert -IncludeManagementTools
```

## Configuration

1. Issue an OCSP Response Signing certificate.
2. Configure the Online Responder array.
3. Add revocation configuration for the Issuing CA.
4. Ensure the OCSP URL is present in AIA extensions for issued certificates.
5. Validate responder signing certificate renewal.

## Validation

```powershell
certutil -url certificate.cer
certutil -urlfetch -verify certificate.cer
```

The OCSP response must report `Good`, `Revoked`, or `Unknown` accurately.
