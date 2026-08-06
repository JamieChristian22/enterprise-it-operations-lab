# Node Exporter Deployment

Install Node Exporter on each Linux host, bind it to the management interface, and restrict port 9100 to the Prometheus server.

Validate:

```bash
curl http://localhost:9100/metrics
systemctl status node_exporter
```
