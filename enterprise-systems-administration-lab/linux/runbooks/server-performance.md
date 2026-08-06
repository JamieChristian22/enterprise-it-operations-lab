# Runbook: Server Performance Degradation

1. Confirm when the issue began and which service is affected.
2. Capture `uptime`, `free -h`, `vmstat 1 5`, and `ps aux --sort=-%cpu`.
3. Check disk latency with `iostat` when available.
4. Check filesystem and inode utilization.
5. Review kernel and service logs.
6. Identify whether the bottleneck is CPU, memory, disk, network, or application behavior.
7. Apply a reversible correction.
8. Compare post-change metrics with the baseline.
