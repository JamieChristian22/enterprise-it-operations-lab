# Build and Configuration Guide

## Build Sequence

### 1. Create the virtual machines

Provision the four systems using the specifications in `configuration/server-inventory.csv`. Attach the additional data and backup disks before configuring `NSS-FILE01`.

### 2. Install and patch Windows Server

Install Windows Server 2022 Standard Desktop Experience, set the local Administrator password securely, install current approved updates, and reboot until no additional approved updates remain.

### 3. Configure identity and networking

Rename each server, set its static address, configure `10.20.30.10` as DNS, and join member servers to `northstar.local`.

### 4. Install server roles

Use `powershell/Install-RequiredRoles.ps1`. Validate each role against `configuration/server-role-matrix.csv`.

### 5. Configure file services

On `NSS-FILE01`:

1. Initialize and format `D:` as NTFS with allocation unit size 64 KB.
2. Create `D:\Shares` and department folders.
3. Create the AD groups listed in the permission matrix.
4. Run `powershell/New-DepartmentShares.ps1`.
5. Enable access-based enumeration.
6. Configure FSRM quotas: 50 GB Finance, 30 GB HR, 100 GB Operations, 20 GB Public.
7. Configure file screening for executables in department shares, with an approved exception path for IT packages.

### 6. Configure print services

Install Print Server, create `NSS-HQ-MFP01`, publish it in Active Directory, set default monochrome duplex printing, and grant print access to `GG_AllEmployees_RW`.

### 7. Configure IIS

Install IIS on `NSS-APP01`, deploy the internal operations status page to `D:\Sites\OperationsPortal`, bind HTTPS on port 443, and remove the default site.

### 8. Apply security baseline

Apply Windows Firewall, RDP/NLA, SMB, audit, Defender, PowerShell logging, and update controls. Run `Test-WindowsServerBaseline.ps1` for each server.

### 9. Configure backup

Initialize `E:` on `NSS-FILE01`, restrict access to Administrators and SYSTEM, and configure a daily 22:00 backup of the system volume and `D:` data volume. Run `Test-BackupFreshness.ps1` after the first backup.

### 10. Validate

Run Pester tests, generate a health report, test file access using read/write and read-only accounts, print a test page, browse the HTTPS endpoint, and restore a deleted test file to an alternate path.
