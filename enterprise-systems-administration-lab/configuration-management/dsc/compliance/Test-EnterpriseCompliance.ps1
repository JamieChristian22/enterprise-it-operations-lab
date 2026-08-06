[CmdletBinding()] param([string[]]$ComputerName=@('DC01','DC02','FS01','FS02','WEB01','WEB02','MON01','BAK01'))
$results = foreach($computer in $ComputerName){
 try { $r=Test-DscConfiguration -ComputerName $computer -Detailed -ErrorAction Stop; [pscustomobject]@{Computer=$computer;InDesiredState=$r.InDesiredState;ResourcesNotInDesiredState=($r.ResourcesNotInDesiredState.ResourceId -join ';');Checked=(Get-Date)} }
 catch { [pscustomobject]@{Computer=$computer;InDesiredState=$false;ResourcesNotInDesiredState=$_.Exception.Message;Checked=(Get-Date)} }
}
$results | Export-Csv .\dsc-compliance.csv -NoTypeInformation
$results
