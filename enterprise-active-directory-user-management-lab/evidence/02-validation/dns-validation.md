# DNS Validation

| Test | Query | Expected Result | Observed Result | Status |
|---|---|---|---|---|
| Forward lookup | `nslookup DC01.corp.contoso.local` | DC IP returned | 10.0.0.10 | PASS |
| Domain lookup | `nslookup corp.contoso.local` | Domain DNS response | 10.0.0.10 | PASS |
| SRV lookup | `_ldap._tcp.dc._msdcs.corp.contoso.local` | LDAP SRV record | `DC01` returned | PASS |
| Reverse lookup | `10.0.0.10` | DC hostname | `DC01.corp.contoso.local` | PASS |
| Client resolution | `Resolve-DnsName DC01` from CL01 | Successful | Successful | PASS |

No stale or duplicate lab DNS records were found.
