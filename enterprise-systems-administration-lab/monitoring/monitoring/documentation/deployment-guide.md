# Deployment Guide

## Prerequisites

- Docker Engine
- Docker Compose plugin
- At least 4 GB RAM
- Ports 3000, 8081, 9090, 9093, 9100, and 9115 available

## Deploy

```bash
cd docker
docker compose pull
docker compose up -d
docker compose ps
```

## Validate

```bash
curl -fsS http://localhost:9090/-/healthy
curl -fsS http://localhost:9093/-/healthy
curl -fsS http://localhost:9115/
curl -I http://localhost:3000
```

## Reload Prometheus

```bash
curl -X POST http://localhost:9090/-/reload
```

## Remove the Lab

```bash
docker compose down
```
