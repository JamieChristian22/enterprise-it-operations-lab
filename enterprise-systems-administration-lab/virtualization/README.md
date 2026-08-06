# Enterprise Virtualization Operations Portfolio

**Author:** Jamie Christian  
**Environment:** Northstar Services Group — fictional 650-user hybrid enterprise lab  
**Platforms:** Microsoft Hyper-V, Windows Failover Clustering, VMware vSphere, vCenter Server, PowerShell, VMware PowerCLI

## Purpose

Demonstrate job-ready virtualization administration, automation, migration, capacity management, backup integration, incident response, change control, and disaster recovery.

## Environment

### Hyper-V
- Cluster: `HV-CLUSTER01`
- Nodes: `HV01`, `HV02`
- CSVs: `CSV-Prod01`, `CSV-Prod02`
- Networks: management, production, backup, Live Migration
- Quorum: file share witness

### VMware
- vCenter: `VCENTER01`
- Cluster: `PROD-CLUSTER`
- Hosts: `ESX01`, `ESX02`, `ESX03`
- Datastores: `DS-PROD-01`, `DS-PROD-02`, `DS-ARCHIVE-01`
- DRS: fully automated
- HA admission control: enabled

## Contents
- 10 Hyper-V runbooks
- 10 VMware runbooks
- 6 automation scripts
- 4 completed incident scenarios
- 3 completed change records
- Evidence samples, standards, inventory, and quality checklist

All names, systems, events, and results are fictional but technically realistic. No secrets or proprietary data are included.
