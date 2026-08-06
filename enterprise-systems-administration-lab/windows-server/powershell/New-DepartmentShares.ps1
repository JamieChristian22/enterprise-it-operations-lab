<#
.SYNOPSIS
Creates Northstar department shares and applies the approved ACL model.
#>
[CmdletBinding(SupportsShouldProcess)]
param(
    [string]$RootPath = 'D:\Shares'
)
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
$departments = @(
    @{Name='Finance'; RW='NORTHSTAR\GG_Finance_RW'; RO='NORTHSTAR\GG_Finance_RO'},
    @{Name='HR'; RW='NORTHSTAR\GG_HR_RW'; RO='NORTHSTAR\GG_HR_RO'},
    @{Name='Operations'; RW='NORTHSTAR\GG_Operations_RW'; RO='NORTHSTAR\GG_Operations_RO'},
    @{Name='Public'; RW='NORTHSTAR\GG_AllEmployees_RW'; RO=$null}
)
New-Item -ItemType Directory -Path $RootPath -Force | Out-Null
foreach ($department in $departments) {
    $path = Join-Path $RootPath $department.Name
    if ($PSCmdlet.ShouldProcess($path, 'Create secured SMB share')) {
        New-Item -ItemType Directory -Path $path -Force | Out-Null
        $acl = Get-Acl $path
        $acl.SetAccessRuleProtection($true, $false)
        $rules = @(
            New-Object System.Security.AccessControl.FileSystemAccessRule('NORTHSTAR\Domain Admins','FullControl','ContainerInherit,ObjectInherit','None','Allow'),
            New-Object System.Security.AccessControl.FileSystemAccessRule('NT AUTHORITY\SYSTEM','FullControl','ContainerInherit,ObjectInherit','None','Allow'),
            New-Object System.Security.AccessControl.FileSystemAccessRule($department.RW,'Modify','ContainerInherit,ObjectInherit','None','Allow')
        )
        if ($department.RO) {
            $rules += New-Object System.Security.AccessControl.FileSystemAccessRule($department.RO,'ReadAndExecute','ContainerInherit,ObjectInherit','None','Allow')
        }
        foreach ($rule in $rules) { $acl.AddAccessRule($rule) }
        Set-Acl -Path $path -AclObject $acl
        if (-not (Get-SmbShare -Name $department.Name -ErrorAction SilentlyContinue)) {
            New-SmbShare -Name $department.Name -Path $path -FullAccess 'NORTHSTAR\Domain Admins' -ChangeAccess $department.RW -ReadAccess $department.RO -FolderEnumerationMode AccessBased -CachingMode None | Out-Null
        }
    }
}
Get-SmbShare -Name ($departments.Name) | Select-Object Name,Path,FolderEnumerationMode,CachingMode
