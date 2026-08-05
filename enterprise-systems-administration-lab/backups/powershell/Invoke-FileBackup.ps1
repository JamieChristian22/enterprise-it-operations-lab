[CmdletBinding()]
param(
    [Parameter(Mandatory)] [string]$Source,
    [Parameter(Mandatory)] [string]$Destination,
    [string]$LogPath = ".\file-backup.log"
)
$ErrorActionPreference = 'Stop'
if (-not (Test-Path $Source)) { throw "Source path does not exist: $Source" }
New-Item -ItemType Directory -Path $Destination -Force | Out-Null
$stamp = Get-Date -Format 'yyyyMMdd-HHmmss'
$target = Join-Path $Destination $stamp
New-Item -ItemType Directory -Path $target -Force | Out-Null
$arguments = @($Source, $target, '/MIR', '/COPY:DATSOU', '/DCOPY:DAT', '/R:2', '/W:5', '/ZB', '/XJ', "/LOG+:$LogPath")
& robocopy @arguments
$code = $LASTEXITCODE
if ($code -ge 8) { throw "Robocopy failed with exit code $code. Review $LogPath" }
"$(Get-Date -Format o) SUCCESS Source=$Source Target=$target ExitCode=$code" | Add-Content $LogPath
Write-Output $target
