[CmdletBinding()] param([int]$Days=45,[string]$Path="$PSScriptRoot\..\Reports\inactive-users.csv")
Import-Module ActiveDirectory;$cut=(Get-Date).AddDays(-$Days);Get-ADUser -Filter {Enabled -eq $true} -Properties LastLogonDate,Department|Where {!$_.LastLogonDate -or $_.LastLogonDate -lt $cut}|Select Name,SamAccountName,Department,LastLogonDate|Export-Csv $Path -NoTypeInformation;"Saved $Path"
