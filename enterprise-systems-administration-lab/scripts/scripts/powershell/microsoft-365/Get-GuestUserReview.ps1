#Requires -Version 7.2
[CmdletBinding()]
param([string]$OutputPath=".\output\guest-user-review.csv")
$rows = Get-MgUser -Filter "userType eq 'Guest'" -All `
    -Property DisplayName,UserPrincipalName,AccountEnabled,CreatedDateTime,ExternalUserState |
    Select-Object DisplayName,UserPrincipalName,AccountEnabled,CreatedDateTime,ExternalUserState
New-Item (Split-Path $OutputPath) -ItemType Directory -Force | Out-Null
$rows | Export-Csv $OutputPath -NoTypeInformation
$rows
