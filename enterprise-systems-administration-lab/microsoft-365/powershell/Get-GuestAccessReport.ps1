#Requires -Version 7.2
[CmdletBinding()]
param(
    [string]$OutputPath = "./reports/guest-access-report.csv"
)

$ErrorActionPreference = "Stop"

$rows = Get-MgUser -Filter "userType eq 'Guest'" -All `
    -Property Id,DisplayName,UserPrincipalName,CreatedDateTime,AccountEnabled,ExternalUserState |
    Select-Object DisplayName,UserPrincipalName,CreatedDateTime,AccountEnabled,ExternalUserState

$rows | Export-Csv -Path $OutputPath -NoTypeInformation
$rows
