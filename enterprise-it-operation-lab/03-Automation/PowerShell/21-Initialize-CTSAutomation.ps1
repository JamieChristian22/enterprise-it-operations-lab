[CmdletBinding(SupportsShouldProcess)]
param([string]$RootPath = 'C:\CTS-Automation')
$ErrorActionPreference = 'Stop'
$folders = 'Logs','Reports','Config','Archive','Backups'
foreach ($folder in $folders) {
    $path = Join-Path $RootPath $folder
    if ($PSCmdlet.ShouldProcess($path,'Create automation directory')) { New-Item -Path $path -ItemType Directory -Force | Out-Null }
}
$config = [ordered]@{ Organization='Christian Technology Services'; Domain='cts-lab.local'; LogRetentionDays=90; ReportRetentionDays=365; AlertDiskFreePercent=15 }
$configPath = Join-Path $RootPath 'Config\cts-automation.json'
if ($PSCmdlet.ShouldProcess($configPath,'Write configuration')) { $config | ConvertTo-Json | Set-Content -Path $configPath -Encoding UTF8 }
[pscustomobject]@{Status='Initialized';RootPath=$RootPath;ConfigPath=$configPath;Timestamp=(Get-Date)}
