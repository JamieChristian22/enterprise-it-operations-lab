# Offline Root CA Build Guide

## Server Standard

- Hostname: `NSS-ROOT-CA01`
- Workgroup server
- No internet access after setup
- BitLocker enabled in the lab where supported
- Powered on only for CA operations
- Separate removable backup media

## CAPolicy.inf

Copy the supplied `configuration/CAPolicy.inf` to `C:\Windows` before installing AD CS.

## Install AD CS

```powershell
Install-WindowsFeature ADCS-Cert-Authority -IncludeManagementTools

Install-AdcsCertificationAuthority `
    -CAType StandaloneRootCA `
    -CACommonName "Northstar Services Root CA" `
    -KeyLength 4096 `
    -HashAlgorithmName SHA256 `
    -CryptoProviderName "RSA#Microsoft Software Key Storage Provider" `
    -ValidityPeriod Years `
    -ValidityPeriodUnits 20
```

## Configure CDP and AIA

Remove LDAP locations from the offline Root CA and publish Root CA certificate and CRL to the HTTP distribution location.

## Operational Rule

The Root CA must be shut down after completing issuance, CRL publication, or recovery operations.
