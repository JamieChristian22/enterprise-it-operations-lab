[CmdletBinding()]
param(
    [Parameter(Mandatory)][string]$OutputPath,
    [string]$DomainController = "DC01",
    [string]$FileServer = "FS01",
    [string]$ClientComputer = "CL01"
)

Import-Module ActiveDirectory -ErrorAction Stop

Get-ADUser -Filter * -Properties DisplayName,Department,Title,Manager,Office,Enabled,EmployeeID,HomeDirectory |
    Select-Object SamAccountName,DisplayName,UserPrincipalName,Department,Title,Manager,Office,Enabled,EmployeeID,DistinguishedName,HomeDirectory |
    Sort-Object SamAccountName |
    Export-Csv (Join-Path $OutputPath "ad-users-live.csv") -NoTypeInformation

Get-ADGroup -Filter * -Properties GroupScope,GroupCategory,Description |
    Select-Object Name,GroupScope,GroupCategory,Description,DistinguishedName |
    Sort-Object Name |
    Export-Csv (Join-Path $OutputPath "ad-groups-live.csv") -NoTypeInformation

Get-ADOrganizationalUnit -Filter * -Properties ProtectedFromAccidentalDeletion |
    Select-Object Name,DistinguishedName,ProtectedFromAccidentalDeletion |
    Sort-Object DistinguishedName |
    Export-Csv (Join-Path $OutputPath "ad-ous-live.csv") -NoTypeInformation

Get-ADComputer -Filter * -Properties OperatingSystem,OperatingSystemVersion,IPv4Address,Enabled,LastLogonDate |
    Select-Object Name,OperatingSystem,OperatingSystemVersion,IPv4Address,Enabled,LastLogonDate,DistinguishedName |
    Sort-Object Name |
    Export-Csv (Join-Path $OutputPath "ad-computers-live.csv") -NoTypeInformation
