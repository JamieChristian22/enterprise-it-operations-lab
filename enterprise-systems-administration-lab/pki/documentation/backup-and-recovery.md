# PKI Backup and Recovery

## Backup Scope

- CA database
- CA private key and certificate
- CA registry configuration
- CAPolicy.inf
- Published CRLs and CA certificates
- Certificate templates inventory
- OCSP configuration
- IIS PKI distribution content

## Backup Commands

```powershell
Backup-CARoleService -Path D:\PKI-Backup
certutil -backupdb D:\PKI-Backup\Database
certutil -backupkey D:\PKI-Backup\Keys
reg export HKLM\SYSTEM\CurrentControlSet\Services\CertSvc\Configuration D:\PKI-Backup\ca-registry.reg
```

## Recovery Test

1. Restore into an isolated lab.
2. Restore CA database and key.
3. Confirm CA service starts.
4. Publish a CRL.
5. Issue and revoke a test certificate.
6. Validate chain and revocation.
7. Record recovery time.
