[CmdletBinding()] param([Parameter(Mandatory)][string]$SamAccountName,[string]$Path="$PSScriptRoot\..\Reports\group-membership.csv")
Import-Module ActiveDirectory; $u=Get-ADUser $SamAccountName -Properties MemberOf
$u.MemberOf|ForEach-Object{Get-ADGroup $_}|Select Name,GroupScope,GroupCategory|Sort Name|Export-Csv $Path -NoTypeInformation; "Report saved to $Path"
