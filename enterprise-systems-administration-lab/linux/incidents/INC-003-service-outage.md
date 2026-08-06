# INC-003 — Northstar API Repeatedly Restarting

**Severity:** High

## Detection
`systemctl --failed` showed `northstar-api.service`.

## Investigation
The journal showed `Address already in use`. `ss -ltnp` revealed a manually started Python process already listening on port 8080.

## Resolution
The unmanaged process was terminated after confirming ownership and purpose. The systemd-managed service was restarted.

## Validation
The unit remained active, port 8080 was owned by the expected process, and the local HTTP check returned success.

## Prevention
Updated the operating procedure to prohibit unmanaged production processes and added service validation.
