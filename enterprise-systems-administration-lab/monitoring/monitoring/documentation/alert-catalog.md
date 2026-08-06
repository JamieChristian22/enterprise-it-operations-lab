# Enterprise Alert Catalog

| Alert | Severity | Threshold | Duration | Response |
|---|---|---|---|---|
| LinuxHostDown | Critical | `up == 0` | 2m | Immediate |
| WindowsHostDown | Critical | `up == 0` | 2m | Immediate |
| LinuxHighCPU | Warning | CPU > 90% | 10m | 30 minutes |
| WindowsHighCPU | Warning | CPU > 90% | 10m | 30 minutes |
| LinuxLowMemory | Critical | Available < 10% | 10m | Immediate |
| LinuxDiskSpaceLow | Warning | Free < 15% | 15m | 1 hour |
| WindowsServiceStopped | Critical | Required service stopped | 5m | Immediate |
| EndpointUnavailable | Critical | Probe failure | 3m | Immediate |
| EndpointLatencyHigh | Warning | Response > 2s | 10m | 30 minutes |
| ContainerRestarting | Warning | Metrics unavailable | 5m | 30 minutes |
| PrometheusTargetDown | Warning | Target down | 5m | 30 minutes |
| PrometheusRuleEvaluationFailures | Warning | Failure count > 0 | 5m | 30 minutes |

## Alert Quality Standard

Every alert must include:

- A clear operational symptom
- A severity level
- A sustained duration
- An affected service label
- A useful description
- A runbook reference
- A measurable recovery condition
