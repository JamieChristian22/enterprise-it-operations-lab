#requires -Modules ActiveDirectory
[CmdletBinding(SupportsShouldProcess)] param([int]$InactiveDays=90,[string]$TargetOU='OU=Disabled Users,OU=Users,DC=corp,DC=jamiechristian,DC=lab',[string]$ReportPath='.\inactive-users.csv')
$cutoff=(Get-Date).AddDays(-$InactiveDays)
$users=Get-ADUser -Filter {Enabled -eq $true -and LastLogonDate -lt $cutoff} -Properties LastLogonDate,Department,Manager | Where-Object {$_.DistinguishedName -notlike '*OU=Tier-0*'}
$users|Select SamAccountName,Name,Department,LastLogonDate,DistinguishedName|Export-Csv $ReportPath -NoTypeInformation
foreach($u in $users){if($PSCmdlet.ShouldProcess($u.SamAccountName,'Disable and move')){Disable-ADAccount $u; Move-ADObject $u.DistinguishedName -TargetPath $TargetOU}}
