# Implementation Guide

**Owner:** Infrastructure Operations  
**Version:** 2.0  
**Change type:** Planned implementation

## 1. Preparation
1. Confirm virtualization or cloud subscriptions are available.
2. Create a secure credential inventory outside the repository.
3. Approve the naming and IP standards in `environment-baseline.md`.
4. Record the implementation as a normal change.
5. Define rollback checkpoints before each major phase.

**Pass criteria:** Required accounts, licenses, networks, and installation media are available.  
**Evidence:** Approved change record and pre-build checklist.

## 2. Core identity services
1. Deploy `NS-DC01` with Windows Server 2022.
2. Assign a static address in `10.20.10.0/24`.
3. Install AD DS and DNS roles.
4. Create the `northstar.lab` forest.
5. Create the standard OU structure.
6. Configure users, groups, delegated permissions, password policy, and account lockout policy.
7. Create privileged administrative accounts separate from standard user accounts.

**Validation commands**
```powershell
Get-ADDomain
Get-ADForest
Get-ADOrganizationalUnit -Filter *
Get-DnsServerZone
repadmin /replsummary
```

**Pass criteria:** Domain authentication succeeds, DNS resolves internal records, policies apply, and event logs contain no unresolved critical errors.

## 3. File services and access control
1. Join `NS-FS01` to the domain.
2. Create departmental folders.
3. Use AGDLP-style access: accounts → global groups → domain local resource groups → permissions.
4. Apply share and NTFS permissions using least privilege.
5. Enable access-based enumeration where supported.
6. Test allowed and denied access with separate user accounts.

**Pass criteria:** Authorized users receive the intended access, unauthorized users are denied, and group membership is traceable.

## 4. Group Policy
Create and link:
- `GPO-Domain-PasswordPolicy`
- `GPO-Workstations-SecurityBaseline`
- `GPO-Servers-AuditPolicy`
- `GPO-Users-DriveMappings`
- `GPO-Workstations-WindowsUpdate`

Validate with:
```powershell
gpupdate /force
gpresult /h C:\Temp\gpresult.html
Get-GPO -All
```

**Rollback:** Unlink the new GPO, restore prior settings from backup, and validate affected systems.

## 5. Microsoft Entra ID and Intune
1. Create cloud users and administrative roles using least privilege.
2. Require MFA for privileged roles.
3. Configure Conditional Access in report-only mode before enforcement.
4. Create Windows enrollment restrictions.
5. Deploy compliance and configuration profiles.
6. Assign policies to a pilot group before broad assignment.
7. Review device and user sign-in logs.

**Pass criteria:** Pilot users can authenticate, compliant devices report healthy, noncompliant devices are identified, and emergency access is preserved.

## 6. AWS network and compute
1. Create VPC `10.50.0.0/16`.
2. Create public and private subnets in two Availability Zones.
3. Associate route tables correctly.
4. Restrict security groups to necessary sources and ports.
5. Launch an encrypted EC2 instance in a private subnet.
6. Attach an IAM role for Systems Manager and CloudWatch.
7. Enable CloudWatch metrics and log collection.
8. Assign the instance to an AWS Backup plan.

**Terraform validation**
```bash
terraform fmt -check
terraform validate
terraform plan
```

**Operational validation**
```bash
aws ec2 describe-instances
aws ssm describe-instance-information
aws cloudwatch describe-alarms
aws backup list-protected-resources
```

**Pass criteria:** No unintended public exposure exists, Systems Manager access works, monitoring is active, and backup protection is visible.

## 7. Linux operations baseline
1. Patch the server.
2. Create named administrative accounts.
3. Disable direct root login.
4. Configure SSH keys or Systems Manager access.
5. Enable firewall rules for required services only.
6. Configure log rotation and time synchronization.
7. Install monitoring agent where required.

**Validation commands**
```bash
hostnamectl
ip addr
ss -tulpn
systemctl --failed
journalctl -p err -b
sudo ufw status verbose
```

## 8. Monitoring and alerting
Configure alerts for:
- CPU above 80% for 15 minutes
- Disk utilization above 85%
- Memory pressure where telemetry is available
- Failed Windows services
- Unreachable host or failed EC2 status check
- Backup failure
- Repeated authentication failures

Each alert must include severity, affected resource, threshold, dashboard link, first-response action, and escalation path.

## 9. Backup and restore
1. Define retention by system criticality.
2. Confirm backup jobs complete successfully.
3. Perform a quarterly restore test.
4. Record recovery time, recovery point, validation results, and cleanup.

**Pass criteria:** Restored data or system starts successfully and application or file integrity is confirmed.

## 10. Acceptance testing
| Test | Expected result |
|---|---|
| Domain sign-in | User authenticates successfully |
| DNS lookup | Internal and external names resolve |
| GPO application | Expected policies appear in gpresult |
| Shared folder | Authorized access succeeds; unauthorized access fails |
| Endpoint compliance | Pilot device reports compliant |
| AWS access | Instance reachable through approved management path |
| Monitoring | Test threshold produces alert |
| Backup | Protected resource and successful job visible |
| Restore | Recovered item passes integrity check |

## 11. Handover
- Update asset inventory.
- Publish final diagrams and procedures.
- Link evidence in `documentation-index.md`.
- Close the implementation change only after acceptance criteria pass.
