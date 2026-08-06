# Ransomware Recovery Runbook

1. Security Lead confirms containment and evidence preservation.
2. Disable affected privileged credentials and isolate compromised networks.
3. Select a recovery point that predates confirmed compromise.
4. Restore Tier 0 services in an isolated clean room.
5. Rotate domain, backup, service, and local administrator credentials.
6. Validate systems with EDR, integrity checks, and security baselines.
7. Restore services in priority order.
8. Reconnect users in controlled waves.
9. Monitor for indicators of reinfection.
10. Preserve all recovery logs for incident review.
