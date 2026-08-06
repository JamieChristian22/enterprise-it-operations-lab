# Enterprise PKI Architecture

```mermaid
flowchart TB
    ROOT[Offline Root CA<br/>NSS-ROOT-CA01] -->|Signs Issuing CA certificate| ISSUING[Enterprise Issuing CA<br/>NSS-ISSUING-CA01]
    ISSUING --> WEB[IIS Servers]
    ISSUING --> USERS[Users]
    ISSUING --> COMPUTERS[Domain Computers]
    ISSUING --> NPS[NPS / VPN]
    ISSUING --> OCSP[OCSP Responder]
    ISSUING --> CRL[HTTP CDP/AIA<br/>pki.northstar.local]
    GPO[Group Policy Auto-Enrollment] --> USERS
    GPO --> COMPUTERS
    CLIENTS[Domain Clients] --> CRL
    CLIENTS --> OCSP
```

## Trust Model

- Root CA remains offline and workgroup-based.
- Issuing CA is domain-joined and handles day-to-day issuance.
- Root and Issuing CA private keys are backed up and access-controlled.
- CRLs and CA certificates are published over HTTP.
- OCSP provides near-real-time revocation status.
- Certificate templates enforce least privilege and approved EKUs.
