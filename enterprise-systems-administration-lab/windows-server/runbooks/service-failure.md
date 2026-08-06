# Runbook: Windows Service Failure

1. Capture service name, status, start mode, dependencies, exit code, and recent events.
2. Confirm whether maintenance or a deployment explains the stop.
3. Check disk, memory, service account status, password expiration, and dependency state.
4. Start the service once and observe behavior.
5. If it fails again, preserve logs and avoid repeated restart loops.
6. Roll back the most recent related change when evidence supports causation.
7. Validate the user-facing function, not only the service status.
