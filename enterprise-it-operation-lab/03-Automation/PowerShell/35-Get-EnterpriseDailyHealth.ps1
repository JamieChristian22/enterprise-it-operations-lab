[CmdletBinding()]
param([string]$OutputPath="$PSScriptRoot\..\Reports\enterprise-daily-health.json")
$checks=[ordered]@{}
foreach($item in @(@{Name='DomainControllers';Script='22-Test-ADHealth.ps1'},@{Name='DNS';Script='25-Test-DNSInfrastructure.ps1'},@{Name='Services';Script='26-Get-CriticalServiceHealth.ps1'},@{Name='Backups';Script='30-Test-BackupFreshness.ps1'})){try{$checks[$item.Name]=& (Join-Path $PSScriptRoot $item.Script);$checks["$($item.Name)Status"]='Collected'}catch{$checks["$($item.Name)Status"]='Failed';$checks["$($item.Name)Error"]=$_.Exception.Message}}
$payload=[ordered]@{Organization='Christian Technology Services';Collected=(Get-Date).ToString('o');Checks=$checks}
New-Item (Split-Path $OutputPath) -ItemType Directory -Force|Out-Null;$payload|ConvertTo-Json -Depth 8|Set-Content $OutputPath -Encoding UTF8;$payload
