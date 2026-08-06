# Tiered Administration Model

## Purpose
Prevent credential theft and lateral movement by separating administrative identities, workstations, and logon rights according to system criticality.

## Tier Definitions

### Tier 0 — Identity control plane
Domain controllers, forest and domain administration, PKI, Entra Connect, identity federation, privileged access systems, and emergency access accounts.

### Tier 1 — Server and application control plane
Member servers, virtualization hosts, management servers, backup infrastructure, enterprise applications, and server administration tools.

### Tier 2 — User and endpoint control plane
Workstations, standard user support, endpoint tools, printers, and local device administration.

## Account Model
| Account | Example | Permitted Scope |
|---|---|---|
| Standard user | `jchristian` | Email and daily productivity |
| Tier 2 admin | `adm2-jchristian` | Endpoints only |
| Tier 1 admin | `adm1-jchristian` | Member servers only |
| Tier 0 admin | `adm0-jchristian` | Identity systems only |

## Mandatory Controls
- Privileged accounts are not used for email or web browsing.
- Tier 0 accounts sign in only from approved Privileged Access Workstations.
- Lower-tier credentials never authenticate to higher-tier systems.
- Interactive logon rights are controlled through GPO.
- Separate admin groups are used for each tier.
- Privileged elevation is time-limited and ticket-backed.
- Break-glass accounts are excluded from normal Conditional Access but are monitored continuously.
- Privileged group membership is reviewed monthly and after every emergency change.

## Validation
Quarterly testing confirms denied logons, effective GPO scope, privileged group membership, stale admin accounts, PAW compliance, and emergency-account readiness.
