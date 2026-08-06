# CHG-2026-043 — July 2026 Windows Server Patching

- Type: Standard
- Risk: Low
- Status: Successful

## Scope
Eight Windows servers across pilot and production rings.

## Implementation
Patched pilot servers first, validated core services, then patched production in two waves. Reboots were staggered to preserve DNS and authentication availability.

## Validation
All servers reported current patch level. AD replication, DNS, DHCP, file shares, and backup agents passed checks.

## Outcome
Eight of eight servers completed successfully; no rollback required.
