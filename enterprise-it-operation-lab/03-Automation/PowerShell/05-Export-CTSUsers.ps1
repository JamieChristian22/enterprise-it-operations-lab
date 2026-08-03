[CmdletBinding()] param([string]$Path="$PSScriptRoot\..\Reports\ad-users.csv")
Import-Module ActiveDirectory; New-Item (Split-Path $Path) -ItemType Directory -Force|Out-Null
Get-ADUser -Filter * -Properties Department,Title,Enabled,LastLogonDate | Select Name,SamAccountName,Department,Title,Enabled,LastLogonDate | Sort Department,Name | Export-Csv $Path -NoTypeInformation; "Exported to $Path"
