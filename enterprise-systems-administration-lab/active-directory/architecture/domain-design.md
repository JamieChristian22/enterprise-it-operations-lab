# Domain and Forest Design

## Design Decision
A single forest and single domain—`corp.jamiechristian.lab`—meets the lab organization's size, trust, policy, and administration requirements. Additional domains would add replication, DNS, and governance complexity without a justified security boundary.

## Domain Controllers
| Server | IP | Site | Roles | GC |
|---|---:|---|---|---|
| JC-DC01 | 10.20.0.10 | HQ-Site | AD DS, DNS, initial FSMO | Yes |
| JC-DC02 | 10.20.0.11 | HQ-Site | AD DS, DNS | Yes |

## FSMO Placement
All five roles begin on `JC-DC01`: Schema Master, Domain Naming Master, RID Master, PDC Emulator, and Infrastructure Master. In this single-domain environment with both DCs as Global Catalogs, this is acceptable. A quarterly resilience test documents a planned PDC Emulator transfer to `JC-DC02` and transfer back.

## Naming Standards
- Users: `first.last`; collision suffix uses middle initial or sequential number.
- Admin accounts: `adm-first.last`.
- Service accounts: `svc-<application>` or gMSA `gmsa-<application>$`.
- Computers: `JC-<SITE>-<TYPE><NN>`; lab examples use `JC-WS01`.
- Groups: `GG-<DEPT>-<ROLE>` and `DL-<RESOURCE>-<ACCESS>`.
