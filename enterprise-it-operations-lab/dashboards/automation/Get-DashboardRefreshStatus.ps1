[CmdletBinding()]
param([string]$DatasetPath=".\datasets")
Get-ChildItem $DatasetPath -Filter *.csv | Select-Object Name,LastWriteTime,Length
