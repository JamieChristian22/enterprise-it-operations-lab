# INC-AD-002 — Domain Controller Replication Warning

**Affected:** JC-DC02  
**Priority:** High  
**Status:** Resolved

`repadmin` reported a temporary name-resolution failure. `JC-DC02` had an incorrect external DNS server configured on its NIC. The NIC was corrected to use `10.20.0.10` and `10.20.0.11`; DNS cache and registration were refreshed. Replication then completed successfully with zero failures in `repadmin /replsummary`.
