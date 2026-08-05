# Network and Service Design

```mermaid
flowchart TB
  NET[192.168.50.0/24 Lab Network]
  DC[DC01 - 192.168.50.10
AD DS / DNS / GPMC]
  FS[FS01 - 192.168.50.20
SMB / NTFS]
  CL[CL01 - DHCP Reservation .100
Windows 11 / RSAT]
  NET --> DC
  NET --> FS
  NET --> CL
  CL -->|Kerberos, LDAP, DNS| DC
  CL -->|SMB 445| FS
  DC -->|AD-integrated DNS and policy| CL
```

All domain members use DC01 as their only DNS server. Administrative access is performed from CL01 using a separate admin credential. Department shares reside on FS01, while permissions are controlled by domain-local resource groups.
