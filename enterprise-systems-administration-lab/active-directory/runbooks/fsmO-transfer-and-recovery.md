# FSMO Transfer and Recovery

## Planned Transfer
Use `Move-ADDirectoryServerOperationMasterRole -Identity JC-DC02 -OperationMasterRole PDCEmulator` during an approved window. Verify with `netdom query fsmo`, test time service and password-change convergence, then record results.

## Seizure
Seize only when the former role holder is permanently unavailable. Complete backup validation, leadership approval, and metadata-cleanup planning. After seizure, do not reconnect the old role holder; rebuild it.
