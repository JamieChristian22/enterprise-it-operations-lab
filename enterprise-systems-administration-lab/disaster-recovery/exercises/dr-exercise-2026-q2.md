# Q2 2026 Disaster Recovery Exercise

## Scenario
Primary virtualization host failure combined with corruption of the production file-server VM.

## Objectives
- Declare DR using documented criteria.
- Restore identity and file services.
- Validate data integrity.
- Meet 60-minute file-service RTO and 30-minute RPO.

## Results
- DR declared in 4 minutes.
- AD/DNS validation completed in 32 minutes from start.
- File service restored in 52 minutes.
- File data recovered to a point 14 minutes before the simulated failure.
- All sampled checksums matched.

## Outcome
PASS. RTO and RPO objectives were met.

## Lessons Learned
- Pre-stage recovery network mappings.
- Reduce DNS TTL before planned exercises.
- Add a documented alternate Incident Commander.
