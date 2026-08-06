# Runbook: Monitoring Platform Outage

1. Check Prometheus, Grafana, Alertmanager, and exporter containers.
2. Review container logs and host resources.
3. Confirm persistent volumes.
4. Restore Prometheus first, then Alertmanager and Grafana.
5. Validate targets, rules, dashboards, and alert delivery.
6. Record monitoring blind-spot duration.
