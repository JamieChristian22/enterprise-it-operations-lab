[CmdletBinding()] param([string]$Destination='.\state-backup')
New-Item $Destination -ItemType Directory -Force|Out-Null;Get-DscConfiguration|Export-Clixml (Join-Path $Destination 'dsc-state.xml');Get-WindowsFeature|? InstallState -eq Installed|Export-Csv (Join-Path $Destination 'features.csv') -NoTypeInformation;Get-Service|Export-Csv (Join-Path $Destination 'services.csv') -NoTypeInformation
