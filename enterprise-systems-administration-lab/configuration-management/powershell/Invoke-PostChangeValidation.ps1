[CmdletBinding()] param([string[]]$ComputerName)
$results=foreach($c in $ComputerName){Test-WSMan $c -ErrorAction SilentlyContinue|Out-Null;[pscustomobject]@{Computer=$c;WinRM=$?;Ping=Test-Connection $c -Quiet -Count 1;Time=Get-Date}};$results|Export-Csv .\post-change-validation.csv -NoTypeInformation;$results
