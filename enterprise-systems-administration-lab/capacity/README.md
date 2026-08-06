# Enterprise Capacity Management Lab

This portfolio project demonstrates enterprise capacity management across Windows servers, Active Directory, DHCP, backup storage, certificates, patching, and shared infrastructure. The lab includes baselines, thresholds, 30/60/90-day forecasts, automation, runbooks, reports, incident/change/problem records, and acceptance testing.

## Business Scenario
Northstar Services operates a hybrid Windows infrastructure supporting 420 users across two sites. Rapid file growth, backup retention, DHCP consumption, and increasing patch duration created a need for formal capacity planning.

## Objectives
- Establish measurable infrastructure baselines.
- Detect warning and critical capacity conditions.
- Forecast resource exhaustion before service impact.
- Standardize operational response and escalation.
- Support budget and change decisions with data.

## Scope
CPU, memory, disk, network, Active Directory database, DHCP scopes, backup repositories, certificate services, and patch windows.

## Key Results
- Identified FS01 data volume projected to reach 85% utilization in 71 days.
- Identified Backup Repository BR01 projected to reach 90% utilization in 94 days.
- Expanded HQ DHCP scope before exhaustion risk became critical.
- Reduced average patch window from 184 to 146 minutes through sequencing changes.
- Completed 28 acceptance tests with a 100% pass rate.

## Repository Structure
- `architecture/`: topology, workflow, and escalation designs.
- `policies/`: governance and standards.
- `inventories/`: infrastructure and monitoring registers.
- `baselines/`: measured utilization data.
- `forecasts/`: 30/60/90-day projections and recommendations.
- `powershell/`: collection, analysis, and reporting automation.
- `reports/`: operational and executive reports.
- `runbooks/`: response procedures.
- `evidence/`: sanitized outputs generated from the lab scenario.
- `tickets/`: incident, problem, and change records.
- `tests/`: completed acceptance testing.
