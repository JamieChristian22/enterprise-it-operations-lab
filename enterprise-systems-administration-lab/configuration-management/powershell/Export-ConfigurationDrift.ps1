[CmdletBinding()] param([string[]]$ComputerName,[string]$Path='.\configuration-drift.csv')
$results=foreach($c in $ComputerName){$r=Test-DscConfiguration -ComputerName $c -Detailed;[pscustomobject]@{Computer=$c;InDesiredState=$r.InDesiredState;DriftedResources=($r.ResourcesNotInDesiredState.ResourceId -join ';');Checked=Get-Date}};$results|Export-Csv $Path -NoTypeInformation;$results
