[CmdletBinding(SupportsShouldProcess)] param([Parameter(Mandatory)][string[]]$ComputerName)
foreach($c in $ComputerName){if(Test-Connection $c -Count 1 -Quiet){if($PSCmdlet.ShouldProcess($c,'Restart')){Restart-Computer $c -Force}}else{Write-Warning "$c is unreachable"}}
