#Requires -Version 7.2
[CmdletBinding()]
param()

$ErrorActionPreference = "Stop"

$graphScopes = @(
    "User.ReadWrite.All",
    "Group.ReadWrite.All",
    "Directory.Read.All",
    "AuditLog.Read.All",
    "Organization.Read.All"
)

Import-Module Microsoft.Graph.Authentication -ErrorAction Stop
Import-Module ExchangeOnlineManagement -ErrorAction Stop

Connect-MgGraph -Scopes $graphScopes -NoWelcome
Connect-ExchangeOnline -ShowBanner:$false

Write-Host "Connected to Microsoft Graph and Exchange Online."
Get-MgContext | Select-Object Account, TenantId, Scopes
