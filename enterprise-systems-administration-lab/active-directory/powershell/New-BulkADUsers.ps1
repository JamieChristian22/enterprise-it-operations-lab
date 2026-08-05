#requires -Modules ActiveDirectory
[CmdletBinding(SupportsShouldProcess)]
param([Parameter(Mandatory)][string]$CsvPath,[string]$Domain='corp.jamiechristian.lab')
$ErrorActionPreference='Stop'
$rows=Import-Csv $CsvPath
foreach($r in $rows){
  $sam=(($r.FirstName+'.'+$r.LastName).ToLower() -replace '[^a-z0-9\.]','')
  if(Get-ADUser -Filter "SamAccountName -eq '$sam'"){Write-Warning "$sam exists";continue}
  $secure=ConvertTo-SecureString $r.TemporaryPassword -AsPlainText -Force
  $params=@{Name="$($r.FirstName) $($r.LastName)";GivenName=$r.FirstName;Surname=$r.LastName;DisplayName="$($r.FirstName) $($r.LastName)";SamAccountName=$sam;UserPrincipalName="$sam@$Domain";Path=$r.OU;Department=$r.Department;Title=$r.Title;AccountPassword=$secure;Enabled=$true;ChangePasswordAtLogon=$true}
  if($PSCmdlet.ShouldProcess($sam,'Create AD user')){New-ADUser @params; $r.Groups -split ';' | Where-Object {$_} | ForEach-Object {Add-ADGroupMember $_ $sam}; Write-Output "Created $sam"}
}
