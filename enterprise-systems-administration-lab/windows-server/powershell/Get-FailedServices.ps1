[CmdletBinding()]param([string]$OutputPath='.\output\failed-services.csv')
$rows=Get-CimInstance Win32_Service|Where-Object{$_.StartMode -eq 'Auto' -and $_.State -ne 'Running'}|Select Name,DisplayName,State,StartMode,StartName
New-Item (Split-Path $OutputPath) -ItemType Directory -Force|Out-Null;$rows|Export-Csv $OutputPath -NoTypeInformation;$rows
if($rows){exit 1}
