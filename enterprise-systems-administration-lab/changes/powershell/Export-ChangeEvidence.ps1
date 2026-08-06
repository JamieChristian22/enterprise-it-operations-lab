[CmdletBinding()]
param([Parameter(Mandatory)][string]$ChangeId,[string]$OutputPath='.')
$dir=Join-Path $OutputPath $ChangeId
New-Item -ItemType Directory -Path $dir -Force | Out-Null
Get-Date | Out-File (Join-Path $dir 'timestamp.txt')
Get-ComputerInfo | Out-File (Join-Path $dir 'computer-info.txt')
Get-Service | Sort-Object Status,Name | Export-Csv (Join-Path $dir 'services.csv') -NoTypeInformation
Get-Volume | Export-Csv (Join-Path $dir 'volumes.csv') -NoTypeInformation
Write-Output $dir
