# Recovery Tier Register

The protected-resource inventory is the authoritative source for backup ownership and service objectives. Operations reconciles the inventory against AWS Config, AWS Backup, Azure Resource Graph, and Recovery Services Vault exports each month.

## Assignment rules

- Tier 0: loss prevents authentication, infrastructure reconstruction, transaction recovery, or regulatory evidence.
- Tier 1: loss disrupts customer-facing or revenue-supporting services.
- Tier 2: loss disrupts internal operations but allows a work-around.
- Tier 3: rebuildable development or test systems.

## Current coverage

Six in-scope resources are registered. All six have a defined owner, RPO, RTO, retention period, encryption method, and last restore-test date. No policy exception is open as of 2026-08-01.
