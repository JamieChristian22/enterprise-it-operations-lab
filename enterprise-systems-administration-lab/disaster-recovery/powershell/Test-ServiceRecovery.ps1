[CmdletBinding()]
param([string[]]$Services=@('DNS','DHCPServer','LanmanServer','W3SVC'))
$results = foreach ($name in $Services) {
  $svc=Get-Service -Name $name -ErrorAction SilentlyContinue
  [pscustomobject]@{Service=$name;Exists=($null-ne$svc);Status=if($svc){$svc.Status}else{'Missing'}}
}
$results | Format-Table -AutoSize
if ($results.Status -contains 'Stopped' -or $results.Status -contains 'Missing') { exit 2 }
