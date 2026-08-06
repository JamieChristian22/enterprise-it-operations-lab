# Enterprise Monitoring, Alerting, and Observability Lab

A production-style infrastructure monitoring portfolio project built with Prometheus, Grafana, Alertmanager, Node Exporter, Windows Exporter, Blackbox Exporter, and cAdvisor.

## Business Scenario

Northstar Services operates a mixed Windows, Linux, container, and web-service environment. The infrastructure operations team is responsible for service availability, performance monitoring, capacity planning, alert response, and incident documentation.

This project demonstrates how an entry-level systems administrator, cloud support engineer, or junior DevOps engineer would deploy, operate, validate, and improve an enterprise monitoring platform.

## Monitored Environment

| Asset | Platform | Monitoring Method |
|---|---|---|
| `linux-app-01` | Ubuntu Server | Node Exporter |
| `linux-db-01` | Ubuntu Server | Node Exporter |
| `win-file-01` | Windows Server | Windows Exporter |
| `northstar-api` | Containerized application | cAdvisor and Blackbox Exporter |
| `portal.northstar.local` | HTTPS endpoint | Blackbox Exporter |
| Prometheus | Monitoring platform | Self-monitoring |
| Alertmanager | Alert routing | Prometheus metrics |
| Grafana | Visualization | Prometheus datasource |

## Demonstrated Skills

- Deploy a monitoring stack with Docker Compose.
- Configure Prometheus scrape jobs and service discovery targets.
- Create actionable alerting and recording rules.
- Build Grafana dashboards for Linux, Windows, applications, containers, and SLOs.
- Configure Alertmanager routing, grouping, inhibition, and escalation.
- Monitor endpoints with Blackbox Exporter.
- Collect Windows and Linux host metrics.
- Track container health with cAdvisor.
- Define SLIs, SLOs, and error budgets.
- Investigate incidents using metrics and alerts.
- Write operational runbooks and post-incident documentation.
- Validate Prometheus rules and configuration in CI.
- Produce capacity, availability, and alert-quality reports.

## Repository Structure

```text
enterprise-monitoring-lab/
├── README.md
├── architecture/
├── alertmanager/
├── blackbox-exporter/
├── cadvisor/
├── docker/
├── documentation/
├── evidence/
├── grafana/
├── incidents/
├── node-exporter/
├── prometheus/
├── reports/
├── runbooks/
├── scripts/
├── tests/
└── windows-exporter/
```

## Quick Start

```bash
cd docker
docker compose up -d
```

Open:

- Grafana: `http://localhost:3000`
- Prometheus: `http://localhost:9090`
- Alertmanager: `http://localhost:9093`
- Blackbox Exporter: `http://localhost:9115`

## Validation

```bash
bash scripts/validate-project.sh
bash scripts/check-prometheus-targets.sh
bash tests/test-required-files.sh
```

## Recruiter Summary

This is not a basic dashboard demo. It is a full operations package showing monitoring architecture, configuration, alert design, troubleshooting, incident handling, reporting, and validation across a mixed enterprise environment.
