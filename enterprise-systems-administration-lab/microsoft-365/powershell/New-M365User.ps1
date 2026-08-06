#Requires -Version 7.2
[CmdletBinding(SupportsShouldProcess)]
param(
    [Parameter(Mandatory)][string]$UserPrincipalName,
    [Parameter(Mandatory)][string]$DisplayName,
    [Parameter(Mandatory)][string]$GivenName,
    [Parameter(Mandatory)][string]$Surname,
    [Parameter(Mandatory)][string]$Department,
    [Parameter(Mandatory)][string]$JobTitle,
    [Parameter(Mandatory)][string]$UsageLocation,
    [Parameter(Mandatory)][string]$SkuPartNumber,
    [string[]]$GroupDisplayNames = @()
)

$ErrorActionPreference = "Stop"

$existingUser = Get-MgUser -Filter "userPrincipalName eq '$UserPrincipalName'" -ConsistencyLevel eventual
if ($existingUser) {
    throw "A user already exists with UPN $UserPrincipalName."
}

$password = [System.Web.Security.Membership]::GeneratePassword(16, 4)
$mailNickname = ($UserPrincipalName -split "@")[0]

if ($PSCmdlet.ShouldProcess($UserPrincipalName, "Create Microsoft 365 user")) {
    $user = New-MgUser `
        -AccountEnabled:$true `
        -DisplayName $DisplayName `
        -GivenName $GivenName `
        -Surname $Surname `
        -Department $Department `
        -JobTitle $JobTitle `
        -MailNickname $mailNickname `
        -UserPrincipalName $UserPrincipalName `
        -UsageLocation $UsageLocation `
        -PasswordProfile @{
            Password = $password
            ForceChangePasswordNextSignIn = $true
        }

    $sku = Get-MgSubscribedSku -All |
        Where-Object SkuPartNumber -eq $SkuPartNumber

    if (-not $sku) {
        throw "License SKU $SkuPartNumber was not found."
    }

    Set-MgUserLicense `
        -UserId $user.Id `
        -AddLicenses @(@{SkuId = $sku.SkuId}) `
        -RemoveLicenses @()

    foreach ($groupName in $GroupDisplayNames) {
        $group = Get-MgGroup -Filter "displayName eq '$groupName'" -ConsistencyLevel eventual
        if (-not $group) {
            Write-Warning "Group not found: $groupName"
            continue
        }
        New-MgGroupMember -GroupId $group.Id -DirectoryObjectId $user.Id
    }

    [pscustomobject]@{
        UserPrincipalName = $UserPrincipalName
        TemporaryPassword = $password
        License = $SkuPartNumber
        Groups = ($GroupDisplayNames -join "; ")
        Status = "Created"
    }
}
