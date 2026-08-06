#Requires -Version 5.1
[CmdletBinding()]
param(
    [Parameter(Mandatory)][string]$CertificatePath
)

$ErrorActionPreference = "Stop"

certutil -dump $CertificatePath
if ($LASTEXITCODE -ne 0) { throw "Certificate dump failed." }

certutil -urlfetch -verify $CertificatePath
if ($LASTEXITCODE -ne 0) { throw "Chain or revocation validation failed." }

Write-Host "PASS certificate chain and revocation validation"
