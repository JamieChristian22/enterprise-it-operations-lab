# PromQL Query Library

## Infrastructure

```promql
100 - (avg by(instance) (rate(node_cpu_seconds_total{mode="idle"}[5m])) * 100)
```

```promql
(node_memory_MemAvailable_bytes / node_memory_MemTotal_bytes) * 100
```

```promql
(node_filesystem_avail_bytes / node_filesystem_size_bytes) * 100
```

```promql
rate(node_network_receive_bytes_total[5m])
```

```promql
rate(node_network_transmit_bytes_total[5m])
```

## Availability

```promql
avg_over_time(probe_success{job="blackbox-http"}[30d]) * 100
```

```promql
probe_duration_seconds{job="blackbox-http"}
```

## Monitoring Platform

```promql
count by(job) (up == 0)
```

```promql
rate(prometheus_tsdb_head_samples_appended_total[5m])
```

```promql
prometheus_engine_query_duration_seconds
```

## Containers

```promql
sum by(name) (rate(container_cpu_usage_seconds_total{name!=""}[5m])) * 100
```

```promql
container_memory_working_set_bytes{name!=""}
```
