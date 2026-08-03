[CmdletBinding(SupportsShouldProcess)] param([int]$MinimumAgeDays=7)
$cutoff=(Get-Date).AddDays(-$MinimumAgeDays); $targets=@($env:TEMP,"$env:SystemRoot\Temp")
foreach($t in $targets){Get-ChildItem $t -Force -Recurse -ErrorAction SilentlyContinue|Where LastWriteTime -lt $cutoff|ForEach-Object{if($PSCmdlet.ShouldProcess($_.FullName,'Delete temporary item')){Remove-Item $_.FullName -Recurse -Force -ErrorAction SilentlyContinue}}}; "Cleanup complete"
