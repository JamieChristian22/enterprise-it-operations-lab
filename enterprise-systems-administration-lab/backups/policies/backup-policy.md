# Enterprise Backup Policy

## Purpose
Protect business systems from accidental deletion, hardware failure, corruption, ransomware, and site-level disruption.

## Scope
Applies to `DC01`, `FS01`, `APP01`, backup configuration, and all repositories documented in this lab.

## Standard
- Use the 3-2-1-1-0 model: three copies, two media types, one offsite, one offline or immutable, and zero unverified backup errors.
- Encrypt backup data at rest and in transit.
- Separate backup administration from standard server administration.
- Retain daily recovery points for 30 days, weekly points for 12 weeks, monthly points for 12 months, and annual points for 7 years.
- Review job failures every business day by 09:00 ET.
- Perform sample-file restores monthly and workload recovery tests quarterly.
- Document every production restore through an approved ticket.

## RPO/RTO
The targets in the root README are approved service objectives. Any missed objective requires an incident record and corrective action.

## Exceptions
Exceptions require documented business justification, risk acceptance, compensating controls, owner approval, and an expiration date.
