#requires -Modules ActiveDirectory
[CmdletBinding()] param([Parameter(Mandatory)][string]$SamAccountName,[int]$Hours=24)
$user=Get-ADUser $SamAccountName
Get-ADDomainController -Filter * | ForEach-Object {
 Get-WinEvent -ComputerName $_.HostName -FilterHashtable @{LogName='Security';Id=4740;StartTime=(Get-Date).AddHours(-$Hours)} -ErrorAction SilentlyContinue |
 Where-Object {$_.Properties[0].Value -eq $user.SamAccountName} |
 Select TimeCreated,MachineName,@{n='LockedAccount';e={$_.Properties[0].Value}},@{n='CallerComputer';e={$_.Properties[1].Value}}
}|Sort TimeCreated -Descending
