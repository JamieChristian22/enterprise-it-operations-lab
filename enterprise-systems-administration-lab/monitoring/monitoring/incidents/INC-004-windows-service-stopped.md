# INC-004 — Windows File Service Stopped

**Severity:** Critical  
**Alert:** WindowsServiceStopped

## Cause
The Server service stopped after an incomplete patch reboot.

## Resolution
The server completed the required reboot and the service returned to automatic running state.

## Validation
SMB access succeeded, exporter metrics returned, and dependent services were healthy.
