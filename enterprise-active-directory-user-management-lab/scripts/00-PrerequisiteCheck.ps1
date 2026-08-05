Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
function Write-LabLog {
    param([string]$Message,[ValidateSet('INFO','WARN','ERROR','SUCCESS')][string]$Level='INFO',[string]$LogPath)
    $line = "{0:u} [{1}] {2}" -f (Get-Date),$Level,$Message
    $line | Tee-Object -FilePath $LogPath -Append
}

$Root = Split-Path -Parent $PSScriptRoot
$LogDir = Join-Path $Root 'evidence\logs'
New-Item -ItemType Directory -Path $LogDir -Force | Out-Null
$LogPath = Join-Path $LogDir ("prerequisite-{0}.log" -f (Get-Date -Format 'yyyyMMdd-HHmmss'))

try {
    Write-LabLog 'Starting prerequisite validation.' INFO $LogPath
    if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]'Administrator')) { throw 'Run PowerShell as Administrator.' }
    Import-Module ActiveDirectory
    $domain = Get-ADDomain
    $required = 'users.csv','groups.csv','group-nesting.csv','shares.csv'
    foreach ($file in $required) {
        if (-not (Test-Path (Join-Path $Root "config\$file"))) { throw "Missing config file: $file" }
    }
    Write-LabLog "Connected to domain $($domain.DNSRoot)." SUCCESS $LogPath
    Write-LabLog 'All prerequisites passed.' SUCCESS $LogPath
} catch {
    Write-LabLog $_.Exception.Message ERROR $LogPath
    exit 1
}
