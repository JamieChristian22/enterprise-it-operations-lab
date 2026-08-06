# AWS Subnets and Route Tables

| Subnet | CIDR | Route |
|---|---|---|
| Public A | `10.50.10.0/24` | `0.0.0.0/0 -> IGW` |
| Public B | `10.50.20.0/24` | `0.0.0.0/0 -> IGW` |
| App A | `10.50.110.0/24` | `0.0.0.0/0 -> NAT A` |
| App B | `10.50.120.0/24` | `0.0.0.0/0 -> NAT B` |
| DB A | `10.50.210.0/24` | On-premises and local only |
| DB B | `10.50.220.0/24` | On-premises and local only |
