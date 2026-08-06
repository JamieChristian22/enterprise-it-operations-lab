# Repository Guide

## Root-Level Purpose

The systems-administration lab is divided by operational discipline so a reviewer can assess one capability without reading the full repository.

## Major Folders

- `active-directory/` — Identity, DNS, GPO, delegation, and lifecycle operations
- `backups/` — Backup policy, monitoring, retention, restoration, and ransomware resilience
- `capacity/` — Utilization baselines, forecasts, thresholds, and expansion decisions
- `changes/` — Change governance, CAB, implementation, rollback, and reporting
- `configuration-management/` — Ansible, DSC, drift detection, and repeatable server state
- `disaster-recovery/` — BIA, RTO/RPO, recovery runbooks, exercises, and evidence
- `docs/` — Central documentation, recruiter navigation, role alignment, and evidence mapping

## Reviewer Strategy

Recruiters should start with `recruiter-quick-start.md`. Technical reviewers should use `evidence-index.md` and `skills-evidence-matrix.md`. Interviewers should use `interview/portfolio-demonstration-guide.md` and the relevant role-alignment file.

## Documentation Standard

Every operational area should include:

- Purpose and scope
- Roles and responsibilities
- Procedure or runbook
- Automation where appropriate
- Evidence of execution
- Validation results
- Risks and corrective actions
- Clear distinction between simulated lab work and production experience
