# Enterprise Issuing CA Build Guide

## Server Standard

- Hostname: `NSS-ISSUING-CA01`
- Domain joined
- Static IP
- Restricted administration
- Enterprise CA role
- Daily backup of CA database and configuration

## Install AD CS

```powershell
Install-WindowsFeature ADCS-Cert-Authority -IncludeManagementTools

Install-AdcsCertificationAuthority `
    -CAType EnterpriseSubordinateCA `
    -CACommonName "Northstar Services Issuing CA" `
    -KeyLength 3072 `
    -HashAlgorithmName SHA256 `
    -CryptoProviderName "RSA#Microsoft Software Key Storage Provider"
```

Submit the subordinate request to the offline Root CA, issue the certificate, install it on the Issuing CA, and publish the Root CA certificate and CRL to Active Directory and HTTP.

## Validation

```powershell
certutil -config - -ping
certutil -getreg CA\CommonName
certutil -view
```
