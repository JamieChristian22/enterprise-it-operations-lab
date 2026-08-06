# Administrative Tiering Standard

**Owner:** Infrastructure and Identity Operations  
**Review cycle:** Quarterly

## Requirements
1. Every administrator receives a standard account and only the minimum required administrative account.
2. Tier 0 credentials may authenticate only to Tier 0 assets and approved PAWs.
3. Tier 1 credentials may authenticate only to member servers and approved management hosts.
4. Tier 2 credentials may authenticate only to endpoints and endpoint-management systems.
5. Domain Admin membership must be temporary except for protected emergency accounts.
6. Service accounts must be non-interactive, documented, vaulted, and reviewed.
7. Privileged sessions must be traceable to an approved ticket or change record.
8. Shared named admin accounts are prohibited.
9. Privileged accounts inactive for 45 days are disabled pending owner review.
10. All privileged group modifications must generate an alert and evidence record.

## GPO Enforcement
- Deny Tier 0 accounts logon locally and through RDP on Tier 1 and Tier 2 systems.
- Deny Tier 1 accounts on Tier 2 endpoints.
- Restrict workstation logon for Tier 0 accounts to `NS-PAW01` and approved PAWs.
- Apply advanced audit policy for account management, directory service changes, and logon events.

## Exceptions
Exceptions require a documented business reason, compensating controls, security approval, expiration date, and named owner.
