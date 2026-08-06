param(
  [Parameter(Mandatory=$true)][string]$VaultName,
  [Parameter(Mandatory=$true)][string]$ResourceGroup
)
$ErrorActionPreference = 'Stop'
Set-AzRecoveryServicesVaultContext -Vault (Get-AzRecoveryServicesVault -Name $VaultName -ResourceGroupName $ResourceGroup)
$from = (Get-Date).ToUniversalTime().AddHours(-26)
$jobs = Get-AzRecoveryServicesBackupJob -From $from
$failed = $jobs | Where-Object { $_.Status -in @('Failed','Cancelled') }
[pscustomobject]@{
  Vault=$VaultName
  WindowStart=$from
  TotalJobs=$jobs.Count
  FailedJobs=$failed.Count
  FailedJobNames=($failed | Select-Object -ExpandProperty WorkloadName)
} | ConvertTo-Json -Depth 4
if ($failed.Count -gt 0) { exit 2 }
