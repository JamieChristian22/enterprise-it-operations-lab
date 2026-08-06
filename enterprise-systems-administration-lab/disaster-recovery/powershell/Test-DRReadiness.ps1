[CmdletBinding()]
param([string[]]$Computers = @('DR-DC01','DR-FS01','DR-SQL01','DR-WEB01'))
$results = foreach ($computer in $Computers) {
    $online = Test-Connection -ComputerName $computer -Count 1 -Quiet -ErrorAction SilentlyContinue
    [pscustomobject]@{Computer=$computer;Online=$online;Checked=(Get-Date)}
}
$results | Format-Table -AutoSize
if ($results.Online -contains $false) { exit 2 }
