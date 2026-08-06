# Architecture Overview

## Logical Design

The environment uses a single Active Directory forest with two domain controllers providing authentication and DNS. Member servers provide file, web, monitoring, backup, and management functions. A Linux administration node supports cross-platform operations and automation.

## Management Plane

Administrators connect through a designated management server. Privileged accounts are separated from standard accounts. PowerShell, Ansible, and DSC are used to configure and validate managed systems.

## Operations Plane

Monitoring collects service health, capacity, and event information. Backup services protect critical systems using local, immutable, and offsite copies. Change records control modifications, while disaster-recovery plans define recovery order and validation.

## Security Boundaries

- Tier 0: Domain controllers, identity, and backup control systems
- Tier 1: Member servers and infrastructure services
- Tier 2: User endpoints and routine support activities

Administrative access follows least privilege and role separation.
