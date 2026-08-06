# Monitoring Architecture

```mermaid
flowchart LR
    L1[linux-app-01<br/>Node Exporter] --> P[Prometheus]
    L2[linux-db-01<br/>Node Exporter] --> P
    W1[win-file-01<br/>Windows Exporter] --> P
    C1[Containers<br/>cAdvisor] --> P
    B1[Web and TCP Targets<br/>Blackbox Exporter] --> P
    P --> G[Grafana]
    P --> A[Alertmanager]
    A --> E[Email Receiver]
    A --> T[Teams Webhook Receiver]
    P --> S[Recording Rules and SLO Metrics]
    G --> D[Operations Dashboards]
```

## Operational Flow

1. Exporters expose platform metrics.
2. Prometheus scrapes and stores time-series data.
3. Recording rules precompute frequently used queries.
4. Alert rules evaluate operational conditions.
5. Alertmanager groups, routes, suppresses, and escalates alerts.
6. Grafana visualizes infrastructure, application, and SLO health.
7. Runbooks guide response and validation.
