[CmdletBinding()]
param([Parameter(Mandatory)][string]$PreCsv,[Parameter(Mandatory)][string]$PostCsv)
$pre=Import-Csv $PreCsv; $post=Import-Csv $PostCsv
foreach($p in $post){
 $b=$pre | Where-Object Computer -eq $p.Computer | Select-Object -First 1
 [pscustomobject]@{Computer=$p.Computer;PreStatus=$b.Status;PostStatus=$p.Status;StatusMatch=($b.Status -eq $p.Status)}
}
