#Requires -Version 5.1
[CmdletBinding(SupportsShouldProcess)]
param(
    [Parameter(Mandatory)][string]$CsvPath,
    [Parameter(Mandatory)][string]$PasswordEnvironmentVariable,
    [string]$ReportPath = ".\output\bulk-user-results.csv"
)
$ErrorActionPreference = "Stop"
Import-Module ActiveDirectory -ErrorAction Stop
if (-not (Test-Path $CsvPath)) { throw "CSV not found: $CsvPath" }
$passwordText = [Environment]::GetEnvironmentVariable($PasswordEnvironmentVariable)
if ([string]::IsNullOrWhiteSpace($passwordText)) { throw "Password environment variable is missing." }
$password = ConvertTo-SecureString $passwordText -AsPlainText -Force
$results = foreach ($row in Import-Csv $CsvPath) {
    try {
        if (Get-ADUser -Filter "SamAccountName -eq '$($row.SamAccountName)'" -ErrorAction SilentlyContinue) {
            throw "Duplicate account."
        }
        Get-ADOrganizationalUnit -Identity $row.OU -ErrorAction Stop | Out-Null
        if ($PSCmdlet.ShouldProcess($row.UserPrincipalName, "Create AD user")) {
            New-ADUser -Name "$($row.GivenName) $($row.Surname)" -GivenName $row.GivenName `
                -Surname $row.Surname -SamAccountName $row.SamAccountName `
                -UserPrincipalName $row.UserPrincipalName -Department $row.Department `
                -Title $row.Title -Path $row.OU -AccountPassword $password `
                -Enabled $true -ChangePasswordAtLogon $true
            foreach ($group in ($row.Groups -split ';' | Where-Object { $_ })) {
                Add-ADGroupMember -Identity $group.Trim() -Members $row.SamAccountName
            }
        }
        [pscustomobject]@{User=$row.UserPrincipalName;Status="Success";Message="Created"}
    } catch {
        [pscustomobject]@{User=$row.UserPrincipalName;Status="Failed";Message=$_.Exception.Message}
    }
}
New-Item (Split-Path $ReportPath) -ItemType Directory -Force | Out-Null
$results | Export-Csv $ReportPath -NoTypeInformation
$results
