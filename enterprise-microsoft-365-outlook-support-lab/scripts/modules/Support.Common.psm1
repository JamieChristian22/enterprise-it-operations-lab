Set-StrictMode -Version Latest

function New-SupportOutputDirectory {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$BasePath,

        [string]$Prefix = "SupportDiagnostics"
    )

    $timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
    $path = Join-Path $BasePath "$Prefix-$timestamp"
    New-Item -ItemType Directory -Path $path -Force | Out-Null
    return $path
}

function Write-SupportLog {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Message,

        [ValidateSet("INFO", "WARN", "ERROR", "SUCCESS")]
        [string]$Level = "INFO",

        [string]$LogPath
    )

    $line = "{0} [{1}] {2}" -f (Get-Date -Format "yyyy-MM-dd HH:mm:ss"), $Level, $Message
    Write-Host $line

    if ($LogPath) {
        $line | Out-File -FilePath $LogPath -Append -Encoding utf8
    }
}

function Test-Administrator {
    $identity = [Security.Principal.WindowsIdentity]::GetCurrent()
    $principal = New-Object Security.Principal.WindowsPrincipal($identity)
    return $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
}

Export-ModuleMember -Function New-SupportOutputDirectory, Write-SupportLog, Test-Administrator
