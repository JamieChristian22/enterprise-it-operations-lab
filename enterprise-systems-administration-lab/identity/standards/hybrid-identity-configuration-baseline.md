# Hybrid Identity Configuration Baseline

- Two Entra Connect servers with one active and one staging
- Matching application version and synchronization rules
- Password Hash Synchronization enabled
- Password writeback enabled only after licensing and security approval
- Accidental deletion threshold configured and tested
- `ms-DS-ConsistencyGuid` source anchor documented
- Routable UPN suffix applied to synchronized users
- Synchronization service account protected and monitored
- Configuration export stored after every approved change
- Health alerts routed to Identity Operations and Security Operations
- TLS, operating system patching, endpoint protection, and restricted administration enforced
