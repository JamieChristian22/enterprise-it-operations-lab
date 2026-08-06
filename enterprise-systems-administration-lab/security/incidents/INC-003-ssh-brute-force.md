# INC-003 — Repeated SSH Authentication Failures

## Cause
An exposed SSH service received repeated login attempts from an external address.

## Resolution
Firewall access was restricted to the management subnet and the source was blocked.

## Validation
No successful unauthorized sign-ins were found.
