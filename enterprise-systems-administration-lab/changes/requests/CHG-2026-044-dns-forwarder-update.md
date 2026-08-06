# CHG-2026-044 — Update DNS Forwarders

- Type: Normal
- Risk: Moderate
- Status: Successful after reschedule

## Objective
Replace deprecated external forwarders with approved resilient resolvers.

## Initial Decision
Deferred at the July 29 CAB because firewall dependency confirmation was missing.

## Final Implementation
After firewall approval, configured forwarders on DC01 and DC02, cleared cache, and tested internal and external resolution from both sites.

## Validation
`Resolve-DnsName`, recursion tests, and replication checks passed.
