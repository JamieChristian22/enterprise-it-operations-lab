# IIS TLS Certificate Deployment

## Workflow

1. Duplicate the Web Server template.
2. Grant enrollment permissions to the IIS server group.
3. Enroll a certificate with the correct DNS SANs.
4. Bind the certificate to HTTPS in IIS.
5. Validate chain and revocation.
6. Confirm certificate renewal planning.

## Validation

```powershell
Get-WebBinding -Protocol https
Get-ChildItem Cert:\LocalMachine\My |
    Where-Object Subject -Like "*NSS-WEB-01*"
```

Use a browser or `openssl s_client` from a trusted client to confirm the chain and hostname.
