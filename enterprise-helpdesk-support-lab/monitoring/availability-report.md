# Service Availability Report

## Reporting Period

July 2026

| Service | Availability | Target | Assessment |
|---|---:|---:|---|
| Active Directory | 99.96% | 99.90% | Met |
| Microsoft 365 | 99.82% | 99.90% | Below target |
| VPN | 99.74% | 99.90% | Below target |
| File Services | 99.91% | 99.90% | Met |
| Endpoint Management | 99.98% | 99.90% | Met |
| Printing | 99.93% | 99.50% | Met |
| Cloud Backup | 99.95% | 99.90% | Met |

## Analysis

Microsoft 365 availability was affected by Outlook authentication-token failures. VPN availability was affected by a RADIUS certificate issue and a DNS configuration issue.

## Actions

- Added certificate-expiry monitoring
- Added DNS validation to VPN deployment checks
- Added identity-change pilot group
- Added correlated Service Desk ticket monitoring
