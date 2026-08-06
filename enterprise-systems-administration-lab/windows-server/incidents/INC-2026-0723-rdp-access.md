# INC-2026-0723 — RDP Access Failure to NSS-APP01

- **Priority:** P3
- **Opened:** July 23, 2026, 10:06 ET
- **Resolved:** July 23, 2026, 10:34 ET

## Symptom

Administrator received a connection timeout from the approved management workstation.

## Findings

DNS and ICMP succeeded, port 3389 failed, WinRM succeeded, and `TermService` was running. The RDP firewall rule had an incorrect remote-address scope of `10.20.31.0/24` after a manual edit.

## Resolution

Restored the approved scope to `10.20.30.0/24`, confirmed NLA remained enabled, and successfully connected from the management workstation. Access from a non-management test address remained blocked.

## Root Cause

A firewall rule was edited outside the standard change script.

## Prevention

Added RDP scope validation to the weekly baseline review and required configuration changes through change control.
