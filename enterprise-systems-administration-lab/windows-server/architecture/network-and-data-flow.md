# Network and Data Flow

| Source | Destination | Protocol/Port | Purpose | Restriction |
|---|---|---|---|---|
| Domain clients | NSS-DC01 | DNS 53 TCP/UDP | Name resolution | Domain network only |
| Domain clients | NSS-DC01 | Kerberos 88 TCP/UDP | Authentication | Domain network only |
| Domain clients | NSS-FILE01 | SMB 445 TCP | File access | Authenticated users; ACL controlled |
| Domain clients | NSS-PRINT01 | RPC/SMB | Printer deployment and jobs | Domain network only |
| Domain clients | NSS-APP01 | HTTPS 443 TCP | Internal application | TLS required |
| Admin subnet | All servers | RDP 3389 TCP | Break-glass GUI administration | `10.20.30.0/24` only; NLA enabled |
| Admin subnet | All servers | WinRM 5985 TCP | PowerShell remoting | `10.20.30.0/24` only |
| NSS-FILE01 | Backup volume | Local block I/O | Backup target | Administrators and SYSTEM only |

## Data Classification

- `D:\Shares\Finance`: confidential business data.
- `D:\Shares\HR`: confidential personnel data.
- `D:\Shares\Operations`: internal operational data.
- `D:\Shares\Public`: internal general-use data.
- `E:\WindowsImageBackup`: restricted recovery data.

## Security Decisions

- SMBv1 is removed.
- Access-based enumeration hides folders users cannot access.
- NTFS permissions are group-based.
- RDP and WinRM are not exposed outside the management network.
- HTTPS is used for the internal application.
- Backups are inaccessible to standard users.
