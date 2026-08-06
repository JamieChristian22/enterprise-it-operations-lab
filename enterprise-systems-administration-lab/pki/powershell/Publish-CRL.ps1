#Requires -Version 5.1
[CmdletBinding(SupportsShouldProcess)]
param(
    [string]$Destination = "C:\inetpub\wwwroot\pki"
)

$ErrorActionPreference = "Stop"

if ($PSCmdlet.ShouldProcess("Certification Authority", "Publish CRL")) {
    certutil -crl
    if ($LASTEXITCODE -ne 0) {
        throw "CRL generation failed."
    }

    $crlFiles = Get-ChildItem "$env:windir\System32\CertSrv\CertEnroll" -Filter *.crl
    Copy-Item $crlFiles.FullName -Destination $Destination -Force

    $crlFiles | Select-Object Name, Length, LastWriteTime
}
