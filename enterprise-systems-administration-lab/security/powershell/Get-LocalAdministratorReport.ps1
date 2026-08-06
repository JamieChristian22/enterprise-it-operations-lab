#Requires -Version 5.1
[CmdletBinding()]
param([string[]]$ComputerName=@($env:COMPUTERNAME),[string]$OutputPath=".\output\local-admins.csv")
$rows=foreach($computer in $ComputerName){
 Invoke-Command -ComputerName $computer -ScriptBlock {
  Get-LocalGroupMember Administrators|ForEach-Object{
   [pscustomobject]@{ComputerName=$env:COMPUTERNAME;Name=$_.Name;ObjectClass=$_.ObjectClass;PrincipalSource=$_.PrincipalSource}
  }
 }
}
New-Item (Split-Path $OutputPath) -ItemType Directory -Force|Out-Null
$rows|Export-Csv $OutputPath -NoTypeInformation
$rows
