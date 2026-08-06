# Kubernetes Persistent Volume Restore

1. Freeze writes to the affected workload and export current manifests.
2. Identify the approved `VolumeSnapshot` and its class.
3. Create a new PVC using the snapshot as the data source.
4. Deploy a temporary validation pod that mounts the restored PVC read-only.
5. Verify filesystem structure, application-specific integrity, ownership, permissions, and malware scan results.
6. Scale the original workload to zero, update the deployment or StatefulSet to use the recovered claim, and scale gradually.
7. Confirm readiness probes, logs, metrics, and application transactions.
8. Retain the original volume until the service owner closes the recovery change.

Do not modify the original PVC during initial recovery validation.
