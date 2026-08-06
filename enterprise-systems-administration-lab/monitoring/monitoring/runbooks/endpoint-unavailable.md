# Runbook: Endpoint Unavailable

1. Confirm probe failure from Prometheus.
2. Test DNS resolution.
3. Test TCP connectivity and TLS.
4. Check reverse proxy, application, and backend dependencies.
5. Review recent deployment history.
6. Restore service.
7. Validate multiple successful probes.
8. Record outage duration.
