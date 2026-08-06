#Requires -Version 7.2
[CmdletBinding()]
param(
    [string]$OutputPath = "./reports/privileged-role-report.csv"
)

$ErrorActionPreference = "Stop"
$rows = foreach ($role in Get-MgDirectoryRole -All) {
    $members = Get-MgDirectoryRoleMember -DirectoryRoleId $role.Id -All
    foreach ($member in $members) {
        $user = Get-MgUser -UserId $member.Id -ErrorAction SilentlyContinue
        [pscustomobject]@{
            RoleName = $role.DisplayName
            DisplayName = $user.DisplayName
            UserPrincipalName = $user.UserPrincipalName
            AccountEnabled = $user.AccountEnabled
        }
    }
}

$rows |
    Sort-Object RoleName, UserPrincipalName |
    Export-Csv -Path $OutputPath -NoTypeInformation

$rows
