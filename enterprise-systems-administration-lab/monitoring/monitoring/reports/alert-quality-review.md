# Alert Quality Review

| Alert | Fires | Actionable | False Positive | Decision |
|---|---:|---:|---:|---|
| LinuxHighCPU | 4 | 3 | 1 | Keep; increase duration |
| EndpointLatencyHigh | 12 | 5 | 7 | Tune threshold |
| LinuxDiskSpaceLow | 2 | 2 | 0 | Keep |
| PrometheusTargetDown | 6 | 4 | 2 | Add dependency labels |
| WindowsServiceStopped | 1 | 1 | 0 | Keep |

## Actions

- Increased latency alert duration from 5 to 10 minutes.
- Added Alertmanager inhibition for child alerts.
- Added service labels to improve routing.
