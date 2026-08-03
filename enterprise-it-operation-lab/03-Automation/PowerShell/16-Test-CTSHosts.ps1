[CmdletBinding()] param([Parameter(Mandatory)][string[]]$ComputerName,[string]$Path="$PSScriptRoot\..\Reports\host-connectivity.csv")
$r=foreach($c in $ComputerName){$ok=Test-Connection $c -Count 2 -Quiet;[pscustomobject]@{Host=$c;Reachable=$ok;Checked=(Get-Date)}};$r|Export-Csv $Path -NoTypeInformation;$r
