param([string]$ResourceGroupName = "rg-northstar-ops-lab")
$ErrorActionPreference = "Stop"
$context = Get-AzContext
if (-not $context) { throw "Connect-AzAccount must be completed first." }
Get-AzVM -ResourceGroupName $ResourceGroupName -Status | Select-Object Name, Location, PowerState
Get-AzRecoveryServicesBackupJob | Select-Object WorkloadName, Status, StartTime, EndTime
Get-AzMetricAlertRuleV2 -ResourceGroupName $ResourceGroupName | Select-Object Name, Enabled, Severity
