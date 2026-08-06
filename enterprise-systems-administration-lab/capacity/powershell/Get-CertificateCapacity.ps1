[CmdletBinding()]
param([int]$WarningDays=45,[int]$CriticalDays=15)
Get-ChildItem Cert:\LocalMachine\My | ForEach-Object {
  $days=($_.NotAfter-(Get-Date)).Days
  [pscustomobject]@{Subject=$_.Subject;Thumbprint=$_.Thumbprint;NotAfter=$_.NotAfter;DaysRemaining=$days;Status=if($days -le $CriticalDays){'Critical'}elseif($days -le $WarningDays){'Warning'}else{'Healthy'}}
}
