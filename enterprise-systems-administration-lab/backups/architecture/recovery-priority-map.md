# Recovery Priority Map

| Priority | Service | Dependency | Recovery Order | Owner |
|---|---|---|---:|---|
| P1 | Active Directory and DNS | Hypervisor, network, backup repository | 1 | Infrastructure Lead |
| P1 | Core network authentication | AD DS and DNS | 2 | Systems Administrator |
| P2 | Department file services | AD DS, storage | 3 | Systems Administrator |
| P2 | LOB application | AD DS, DNS, database | 4 | Application Owner |
| P3 | Reporting services | LOB application | 5 | Business Systems Analyst |

Recovery is declared successful only after technical validation and service-owner acceptance.
