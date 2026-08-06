# Troubleshooting Guide

**Owner:** IT Operations  
**Version:** 2.0

## Core method
1. Confirm the user-visible symptom.
2. Establish scope and impact.
3. Identify recent changes.
4. Reproduce or collect evidence.
5. Test one hypothesis at a time.
6. Apply the least-risk corrective action.
7. Validate technically and with the user.
8. Document the result, cause, and prevention.

## Scenario 1 — User cannot sign in
**Checks**
```powershell
Get-ADUser username -Properties Enabled,LockedOut,PasswordExpired
Search-ADAccount -LockedOut
nltest /dsgetdc:northstar.lab
```
- Confirm username, device, network, and exact error.
- Verify the account is enabled and not locked.
- Confirm DNS points to the domain DNS server.
- Check time synchronization.
- Review domain controller authentication logs.

**Resolution options:** Unlock account, reset password after identity verification, correct DNS, synchronize time, or escalate suspected compromise.  
**Validation:** User signs in and relevant logs show success.

## Scenario 2 — DNS resolution failure
```powershell
ipconfig /all
nslookup northstar.lab
Resolve-DnsName northstar.lab
ipconfig /flushdns
```
- Compare configured resolver to the baseline.
- Test by name and IP.
- Validate DNS service and zone health on `NS-DC01`.

**Escalate when:** Multiple subnets fail, the DNS zone is missing, or the domain controller is unhealthy.

## Scenario 3 — Group Policy not applying
```powershell
gpresult /r
gpresult /h C:\Temp\gpresult.html
gpupdate /force
Get-WinEvent -LogName Microsoft-Windows-GroupPolicy/Operational -MaxEvents 50
```
Check OU placement, security filtering, WMI filters, replication, network access, and policy precedence.

## Scenario 4 — Server disk above 90%
### Windows
```powershell
Get-Volume
Get-ChildItem C:\ -File -Recurse -ErrorAction SilentlyContinue | Sort-Object Length -Descending | Select-Object -First 20 FullName,Length
```
### Linux
```bash
df -h
du -xah / | sort -h | tail -30
journalctl --disk-usage
```
Do not delete unknown files. Identify ownership, retention requirements, and active processes before cleanup. Escalate when growth is unexplained or business data is at risk.

## Scenario 5 — Windows service stopped
```powershell
Get-Service -Name servicename
Get-WinEvent -LogName System -MaxEvents 100
sc.exe qc servicename
```
Check dependencies, service account, recent configuration, port conflicts, and event logs. Restart only after identifying likely cause and confirming no data-corruption risk.

## Scenario 6 — Linux application unavailable
```bash
systemctl status app.service
journalctl -u app.service --since "1 hour ago"
ss -tulpn
curl -I http://localhost:PORT
sudo ufw status
```
Validate process, configuration syntax, port binding, firewall, dependency access, and disk space.

## Scenario 7 — Microsoft 365 access issue
- Confirm service health and scope.
- Review user license and sign-in status.
- Confirm MFA and Conditional Access result.
- Check device compliance when access is device-dependent.
- Review sign-in logs for the failure reason.

**Escalate when:** Tenant-wide service health is affected or a policy change has broad unintended impact.

## Scenario 8 — Intune device noncompliance
- Force device sync.
- Review compliance policy result by setting.
- Confirm encryption, antimalware, operating-system version, and account state.
- Review assignment conflicts.
- Remediate the failed control rather than bypassing compliance.

## Scenario 9 — AWS EC2 health failure
```bash
aws ec2 describe-instance-status --include-all-instances
aws cloudwatch describe-alarms
aws ssm describe-instance-information
```
Distinguish EC2 system status, instance status, and application health. Review recent changes, CloudWatch logs, disk, memory, service state, and security-group rules. Replace the instance from known-good automation when repair is higher risk than rebuild.

## Scenario 10 — Backup job failed
- Confirm protected resource and policy assignment.
- Review job error and permissions.
- Check storage availability, agent status, and connectivity.
- Retry only after correcting the cause.
- Open a P2 incident when a critical system lacks a valid recovery point.

## Scenario 11 — High CPU alert
### Windows
```powershell
Get-Process | Sort-Object CPU -Descending | Select-Object -First 10
Get-Counter '\Processor(_Total)\% Processor Time'
```
### Linux
```bash
top
ps aux --sort=-%cpu | head
```
Confirm duration, process owner, recent change, workload demand, and whether service response is degraded. Avoid terminating a process before understanding business impact.

## Escalation package
Include ticket ID, timeline, scope, exact errors, commands run, relevant logs, recent changes, hypotheses tested, actions taken, current workaround, and the next recommended action.
