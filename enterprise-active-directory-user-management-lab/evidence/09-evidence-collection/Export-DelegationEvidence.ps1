[CmdletBinding()]
param(
    [Parameter(Mandatory)][string]$OutputPath,
    [string]$DomainController = "DC01",
    [string]$FileServer = "FS01",
    [string]$ClientComputer = "CL01"
)

Import-Module ActiveDirectory -ErrorAction Stop

$domainDn = (Get-ADDomain).DistinguishedName
dsacls $domainDn | Out-File (Join-Path $OutputPath "domain-delegation-live.txt") -Encoding utf8

Get-ADGroupMember "GG_HelpDesk_Tier1" -Recursive |
    Select-Object Name,SamAccountName,ObjectClass,DistinguishedName |
    Export-Csv (Join-Path $OutputPath "helpdesk-tier1-members-live.csv") -NoTypeInformation

Get-ADGroupMember "GG_HelpDesk_Tier2" -Recursive |
    Select-Object Name,SamAccountName,ObjectClass,DistinguishedName |
    Export-Csv (Join-Path $OutputPath "helpdesk-tier2-members-live.csv") -NoTypeInformation
