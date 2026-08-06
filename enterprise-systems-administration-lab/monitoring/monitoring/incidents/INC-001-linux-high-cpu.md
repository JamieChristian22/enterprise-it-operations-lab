# INC-001 — Linux Application Server High CPU

**Severity:** High  
**Alert:** LinuxHighCPU

## Summary
CPU utilization on `linux-app-01` remained above 95% for 14 minutes.

## Investigation
The operations dashboard showed a single Python process consuming most CPU. Application logs showed a retry loop caused by an unavailable downstream API.

## Resolution
The application service was restarted after the downstream dependency recovered. A retry backoff configuration was added.

## Validation
CPU returned below 20%, the health endpoint returned HTTP 200, and no further alerts fired.

## Prevention
Added dependency monitoring and a high-retry-rate application metric.
