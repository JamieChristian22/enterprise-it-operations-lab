# Lab Build Guide

## 1. Objective

Build a realistic small-enterprise Windows domain that supports identity administration, access control, file services, Group Policy, support tickets, and auditing.

## 2. Systems

| Hostname | Operating System | Role | Address |
|---|---|---|---|
| DC01 | Windows Server 2022 | AD DS, DNS, Group Policy | 10.20.10.10/24 |
| FS01 | Windows Server 2022 | File server | 10.20.10.20/24 |
| CL01 | Windows 11 Enterprise | Domain workstation / RSAT | DHCP reservation 10.20.10.101 |

Gateway: `10.20.10.1`  
DNS for domain members: `10.20.10.10`  
Domain: `corp.northstar.local`  
NetBIOS: `NORTHSTAR`

## 3. Resource Sizing

- DC01: 2 vCPU, 4 GB RAM, 60 GB disk
- FS01: 2 vCPU, 4 GB RAM, 100 GB disk
- CL01: 2 vCPU, 4–8 GB RAM, 64 GB disk
- Network: isolated internal virtual network or secured cloud subnet

## 4. Build Sequence

### Phase A — Base Servers

1. Install Windows Server 2022 on DC01 and FS01.
2. Rename the hosts and restart.
3. Assign static IP addresses to both servers.
4. Set DC01 preferred DNS to its own address after promotion.
5. Install all updates.
6. Confirm time synchronization.

### Phase B — Domain Controller

On DC01:

```powershell
Install-WindowsFeature AD-Domain-Services,DNS,GPMC -IncludeManagementTools
Install-ADDSForest `
  -DomainName 'corp.northstar.local' `
  -DomainNetbiosName 'NORTHSTAR' `
  -InstallDNS `
  -Force
```

After restart:

```powershell
Get-ADDomain
Get-ADForest
Get-DnsServerZone
```

### Phase C — Domain Members

On FS01 and CL01:

1. Configure DNS to `10.20.10.10`.
2. Verify `Resolve-DnsName corp.northstar.local`.
3. Join the domain:

```powershell
Add-Computer -DomainName 'corp.northstar.local' -Credential (Get-Credential) -Restart
```

4. Move FS01 to `OU=File Servers,OU=Servers,OU=Northstar,DC=corp,DC=northstar,DC=local` after the OU build.
5. Move CL01 to the Workstations OU for its site.

### Phase D — Administration Tools

On CL01:

```powershell
Get-WindowsCapability -Name RSAT* -Online | Where-Object State -ne Installed |
  Add-WindowsCapability -Online
```

Confirm access to:

- Active Directory Users and Computers
- Group Policy Management
- DNS Manager
- PowerShell ActiveDirectory module

### Phase E — Repository Deployment

Copy the project to `C:\IT-Lab\enterprise-active-directory-user-management-lab` on CL01 or DC01. Open PowerShell as administrator, then run scripts in numerical order.

## 5. Administrative Accounts

Use separate accounts:

- `jamie.christian` — standard daily account
- `adm.jchristian` — privileged administrative account
- `svc.filescan` — scoped service account, denied interactive logon

Do not browse the web, read email, or perform routine tasks while signed in with the privileged account.

## 6. Verification Commands

```powershell
Get-ADOrganizationalUnit -Filter * | Sort-Object DistinguishedName
Get-ADGroup -Filter * -SearchBase 'OU=Groups,OU=Northstar,DC=corp,DC=northstar,DC=local'
Get-ADUser -Filter * -Properties Department,Title,Manager,Enabled
Get-GPO -All | Select-Object DisplayName,GpoStatus
```

## 7. Recovery Preparation

Before production-like changes:

- Create a VM checkpoint only for lab recovery, not as a replacement for backup.
- Export current group memberships.
- Back up GPOs using `Backup-GPO`.
- Enable the AD Recycle Bin.
- Record the change in `evidence/change-record.md`.

```powershell
Enable-ADOptionalFeature 'Recycle Bin Feature' -Scope ForestOrConfigurationSet -Target 'corp.northstar.local'
```

## 8. Completion Criteria

- Domain members resolve DNS and authenticate successfully.
- OU and group structures match the design.
- All sample users are created in the correct OUs.
- Shared folders are accessible only to authorized groups.
- Policies apply to the intended targets.
- Onboarding and offboarding scripts complete successfully.
- Audit and validation reports are produced.
