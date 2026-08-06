#Requires -Version 5.1
[CmdletBinding()]
param([string]$OutputPath=".\output\privileged-access.csv")
Import-Module ActiveDirectory -ErrorAction Stop
$groups="Domain Admins","Enterprise Admins","Schema Admins","Backup Operators"
$rows=foreach($group in $groups){
 Get-ADGroupMember $group -Recursive -ErrorAction SilentlyContinue|ForEach-Object{
  [pscustomobject]@{Group=$group;Name=$_.Name;SamAccountName=$_.SamAccountName;ObjectClass=$_.ObjectClass}
 }
}
New-Item (Split-Path $OutputPath) -ItemType Directory -Force|Out-Null
$rows|Export-Csv $OutputPath -NoTypeInformation
$rows
