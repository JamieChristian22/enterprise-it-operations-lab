# IP Address Plan

| Network | CIDR | Purpose |
|---|---|---|
| Headquarters Users | `10.10.10.0/24` | Corporate endpoints |
| Headquarters Servers | `10.10.20.0/24` | Windows and Linux servers |
| Headquarters Management | `10.10.30.0/24` | Administrative access |
| Headquarters Printers | `10.10.40.0/24` | Printers and multifunction devices |
| Headquarters Voice | `10.10.50.0/24` | VoIP |
| Headquarters Guest | `10.10.60.0/24` | Internet-only access |
| Site 1 Users | `10.11.10.0/24` | Distribution site users |
| Site 2 Users | `10.12.10.0/24` | Distribution site users |
| AWS VPC | `10.50.0.0/16` | Production AWS workloads |
| AWS Public A | `10.50.10.0/24` | ALB / NAT |
| AWS Public B | `10.50.20.0/24` | ALB / NAT |
| AWS App A | `10.50.110.0/24` | Private applications |
| AWS App B | `10.50.120.0/24` | Private applications |
| AWS DB A | `10.50.210.0/24` | Private databases |
| AWS DB B | `10.50.220.0/24` | Private databases |
