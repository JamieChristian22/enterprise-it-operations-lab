# Monitoring Data Flow

```mermaid
flowchart LR
    WIN[Windows Exporter] --> PROM[Prometheus]
    LINUX[Node Exporter] --> PROM
    APP[Application Metrics] --> PROM
    BLACKBOX[Blackbox Exporter] --> PROM
    PROM --> GRAFANA[Grafana]
    PROM --> ALERT[Alertmanager]
    ALERT --> EMAIL[Email]
    ALERT --> TEAMS[Microsoft Teams]
    WINLOG[Windows Events] --> LOGS[Central Log Platform]
    SYSLOG[Linux Syslog] --> LOGS
```
