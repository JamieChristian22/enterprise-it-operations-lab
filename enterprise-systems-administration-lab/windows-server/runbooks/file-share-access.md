# Runbook: File Share Access Failure

## Trigger

A user cannot open a mapped drive, receives Access Denied, cannot see a folder, or can read but not modify files.

## Initial Data

Record user, device, share path, error text, first occurrence, whether others are affected, and the expected access level.

## Procedure

1. Confirm DNS and SMB reachability:
   ```powershell
   Resolve-DnsName NSS-FILE01
   Test-NetConnection NSS-FILE01 -Port 445
   ```
2. Confirm the share exists:
   ```powershell
   Get-SmbShare -CimSession NSS-FILE01 -Name Finance
   ```
3. Confirm the user token contains the approved group:
   ```powershell
   whoami /groups
   Get-ADPrincipalGroupMembership jdoe | Select-Object Name
   ```
4. Review share permissions:
   ```powershell
   Get-SmbShareAccess -CimSession NSS-FILE01 -Name Finance
   ```
5. Review NTFS permissions:
   ```powershell
   Invoke-Command NSS-FILE01 { (Get-Acl 'D:\Shares\Finance').Access }
   ```
6. Verify the account is enabled and group membership is correct.
7. After a group change, have the user sign out and back in to refresh the token.
8. Test with the UNC path `\\NSS-FILE01\Finance` rather than the mapped-drive letter.

## Decision Points

- **Port 445 fails:** investigate firewall, network path, or server availability.
- **Share missing:** restore the share configuration using `New-DepartmentShares.ps1`.
- **Group missing:** add the user only after owner approval.
- **Share allows access but NTFS denies it:** correct the NTFS group mapping; do not grant direct user access.
- **Only mapped drive fails:** refresh Group Policy and remap the drive.

## Validation

The user can perform the approved action, unauthorized folders remain hidden, and a second test confirms no excessive permissions were introduced.

## Rollback

Remove any newly added group membership or ACL entry if validation fails, then restore the previous ACL from the change evidence.

## Escalation

Escalate to Security if an explicit Deny entry or unexplained privilege change is found. Escalate to Storage if the share is unavailable because of disk or filesystem errors.
