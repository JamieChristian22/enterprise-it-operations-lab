# Replication Troubleshooting Runbook

1. Confirm network reachability and DNS resolution between DCs.
2. Run `repadmin /replsummary` and `repadmin /showrepl * /errorsonly`.
3. Validate time synchronization and Kerberos skew.
4. Run `dcdiag /test:dns /e /v` and inspect Directory Service, DNS Server, and DFS Replication logs.
5. Verify SYSVOL and NETLOGON shares.
6. Correct DNS, RPC/firewall, time, or topology issues before forcing replication.
7. Run `repadmin /syncall /AdeP` only after the root cause is corrected.
8. Re-run health checks and document pre/post results.
