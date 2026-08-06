# AIA, CDP, and CRL Configuration

## HTTP Locations

- AIA: `http://pki.northstar.local/pki/<ServerDNSName>_<CaName><CertificateName>.crt`
- CDP: `http://pki.northstar.local/pki/<CaName><CRLNameSuffix><DeltaCRLAllowed>.crl`

## Goals

- Clients can build the complete certificate chain.
- Clients can retrieve current revocation data.
- CRL publication occurs before the previous CRL expires.
- HTTP paths remain highly available.

## Validation

```powershell
certutil -urlfetch -verify certificate.cer
certutil -dump certificate.cer
Invoke-WebRequest http://pki.northstar.local/pki/
```

## CRL Schedule

| CA | Base CRL | Overlap |
|---|---|---|
| Root CA | 26 weeks | 2 weeks |
| Issuing CA | 7 days | 2 days |
