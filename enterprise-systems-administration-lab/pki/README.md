# Enterprise Public Key Infrastructure (PKI) Lab

A production-style two-tier Microsoft PKI portfolio project demonstrating offline Root CA design, enterprise Issuing CA operations, AD CS, certificate templates, auto-enrollment, CRL and AIA publishing, OCSP, IIS TLS, certificate lifecycle management, backup and recovery, automation, incident response, and compliance reporting.

## Business Scenario

Northstar Services operates a Windows Active Directory environment and requires an internal PKI to support:

- Internal TLS certificates
- Computer and user certificates
- Secure web applications
- VPN and NPS authentication
- Device identity
- Administrative signing and encryption
- Certificate auto-enrollment
- Revocation and trust validation

The infrastructure team must design and operate a secure two-tier PKI while protecting the offline Root CA and maintaining certificate availability.

## Environment

| Component | Configuration |
|---|---|
| Active Directory domain | `northstar.local` |
| Offline Root CA | `NSS-ROOT-CA01` |
| Enterprise Issuing CA | `NSS-ISSUING-CA01` |
| Web enrollment / CRL host | `pki.northstar.local` |
| OCSP responder | `NSS-OCSP-01` |
| IIS test server | `NSS-WEB-01` |
| Domain controller | `NSS-DC-01` |
| PKI admin workstation | `NSS-ADM-01` |
| Root CA validity | 20 years |
| Issuing CA validity | 10 years |
| End-entity certificate validity | 1–2 years depending on template |

## Demonstrated Skills

- Design a secure two-tier PKI.
- Build and protect an offline Root CA.
- Deploy an enterprise Issuing CA.
- Configure AIA and CDP locations.
- Publish and validate CRLs.
- Configure Online Responder / OCSP.
- Create and manage certificate templates.
- Configure Group Policy auto-enrollment.
- Issue IIS TLS certificates.
- Enroll user, computer, server, and NPS certificates.
- Revoke, renew, and recover certificates.
- Back up and restore CA configuration and private keys.
- Audit certificate inventory and expiration risk.
- Automate PKI operations with PowerShell.
- Troubleshoot trust, chain, revocation, and enrollment failures.
- Document changes, incidents, and operational evidence.

## Repository Structure

```text
enterprise-pki-lab/
├── README.md
├── architecture/
├── changes/
├── configuration/
├── documentation/
├── evidence/
├── incidents/
├── powershell/
├── recovery/
├── reports/
├── runbooks/
├── templates/
├── tests/
└── validation/
```

## Safe Lab Usage

Use this project only in an isolated Active Directory lab. Replace sample names, URLs, and paths before deployment. Never place an offline Root CA on a domain-joined production server.

## Recommended Demonstration Flow

1. Review architecture and security model.
2. Build the offline Root CA.
3. Build the enterprise Issuing CA.
4. Configure AIA, CDP, CRL, and OCSP.
5. Create templates.
6. Configure auto-enrollment.
7. Issue an IIS TLS certificate.
8. Revoke and renew a certificate.
9. Run validation scripts.
10. Complete backup and recovery testing.
11. Review incidents, runbooks, reports, and evidence.

## Recruiter Summary

This project demonstrates enterprise PKI design and operations rather than a basic self-signed certificate exercise. It shows how trust, certificate issuance, revocation, renewal, automation, recovery, and documentation work together in a Windows infrastructure environment.
