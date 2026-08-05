# Evidence Quality Gates

An evidence bundle is accepted only when:

1. Collection completes without an unhandled error.
2. Every required collector produces output.
3. Domain health shows no unresolved critical failure.
4. Replication failures equal zero in the single-DC lab context.
5. GPO inventory contains all expected policies.
6. User, group, OU, and computer inventories are non-empty.
7. Permissions exports contain no undocumented broad-access assignment.
8. The SHA-256 manifest covers every generated evidence file.
9. Timestamps are recorded in UTC or include an offset.
10. Any failed test is documented with remediation and retest results.
