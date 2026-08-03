[CmdletBinding()] param([Parameter(Mandatory)][string[]]$ComputerName,[int[]]$Port=53,80,443,3389,[string]$Path="$PSScriptRoot\..\Reports\port-tests.csv")
$r=foreach($c in $ComputerName){foreach($p in $Port){$t=Test-NetConnection $c -Port $p -WarningAction SilentlyContinue;[pscustomobject]@{Host=$c;Port=$p;Open=$t.TcpTestSucceeded}}};$r|Export-Csv $Path -NoTypeInformation;$r
