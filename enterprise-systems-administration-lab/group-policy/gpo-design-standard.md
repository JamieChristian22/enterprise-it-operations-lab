# Group Policy Design Standard

## Purpose

Establish a repeatable and auditable standard for designing, naming, testing, deploying, maintaining, and retiring Group Policy Objects in `corp.northstar.local`.

## Design principles

1. Separate computer and user configuration when practical.
2. Link GPOs to the narrowest stable OU that represents the intended scope.
3. Use a dedicated Pilot OU before production deployment.
4. Avoid `Enforced` and `Block Inheritance` unless the exception is documented and approved.
5. Use security filtering for access control, not as a substitute for poor OU design.
6. Keep WMI filters rare, simple, and performance-tested.
7. Back up each GPO before material changes.
8. Record owner, purpose, version, link, filtering, dependencies, test results, and rollback steps.
9. Disable unused Computer or User Configuration sections to reduce processing overhead.
10. Never edit the Default Domain Policy or Default Domain Controllers Policy for unrelated settings.

## Naming convention

`CORP-[Scope]-[Function]-v[Major.Minor]`

Examples:

- `CORP-WS-Security-Baseline-v1.0`
- `CORP-USR-Session-Security-v1.0`
- `CORP-KIOSK-Lockdown-v1.0`

Approved scope codes: `DOM`, `DC`, `SRV`, `WS`, `USR`, `HD`, `KIOSK`, and `PILOT`.

## Change lifecycle

`Draft → Technical Review → Pilot → Business Validation → Approved → Production → Monitored → Retired`

## Required controls

Every production GPO must have:

- A unique name and version
- A documented business owner and technical owner
- A change record
- A tested backup
- A pilot result
- A validation method
- A rollback method
- A review date no more than 12 months away

## Precedence and conflicts

Processing order is Local, Site, Domain, then OU. Within the same container, lower link-order numbers have higher precedence. Child OUs normally override parent OU settings unless a link is enforced. Policy conflicts must be resolved through design and documented precedence, not repeated enforcement.

## Security filtering

`Authenticated Users` may retain Read permission while Apply Group Policy is removed when precise filtering is required. The intended group receives both Read and Apply Group Policy. Computer settings require the computer account to possess the necessary permissions.

## Loopback processing

Loopback is approved only for shared or role-based computers such as kiosks, training rooms, and reception systems. `Merge` preserves normal user policy and adds computer-location policy. `Replace` ignores normal user policy and applies only user policy linked to the computer's location. The selected mode must be documented.

## Backup and recovery

- Backups are written to a dated, access-controlled path.
- Backup validation includes manifest review and a documented test restore in a non-production OU.
- Rollback may include unlinking, disabling the affected configuration section, restoring a known-good backup, or removing a preference item.
- Deleting a GPO is the final option, not the first rollback action.
