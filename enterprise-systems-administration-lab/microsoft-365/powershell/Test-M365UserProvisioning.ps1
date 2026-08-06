#Requires -Version 7.2
[CmdletBinding()]
param(
    [Parameter(Mandatory)][string]$UserPrincipalName,
    [string[]]$RequiredGroups = @()
)

$ErrorActionPreference = "Stop"
$results = [System.Collections.Generic.List[object]]::new()

function Add-TestResult {
    param([string]$Control, [bool]$Passed, [string]$Details)
    $results.Add([pscustomobject]@{
        Control = $Control
        Passed = $Passed
        Details = $Details
    })
}

$user = Get-MgUser -UserId $UserPrincipalName -Property Id,AccountEnabled,UsageLocation
Add-TestResult "User exists" ($null -ne $user) $UserPrincipalName
Add-TestResult "Account enabled" $user.AccountEnabled ([string]$user.AccountEnabled)
Add-TestResult "Usage location configured" (-not [string]::IsNullOrWhiteSpace($user.UsageLocation)) $user.UsageLocation

$licenses = Get-MgUserLicenseDetail -UserId $user.Id
Add-TestResult "License assigned" ($licenses.Count -gt 0) (($licenses.SkuPartNumber) -join "; ")

$memberObjects = Get-MgUserMemberOf -UserId $user.Id -All
$memberIds = $memberObjects.Id
foreach ($groupName in $RequiredGroups) {
    $group = Get-MgGroup -Filter "displayName eq '$groupName'" -ConsistencyLevel eventual
    Add-TestResult "Group membership: $groupName" ($group.Id -in $memberIds) $group.Id
}

$mailbox = Get-EXOMailbox -Identity $UserPrincipalName -ErrorAction SilentlyContinue
Add-TestResult "Mailbox provisioned" ($null -ne $mailbox) $mailbox.RecipientTypeDetails

$results
if ($results.Passed -contains $false) { exit 1 }
