#Requires -Version 5.1
[CmdletBinding()]
param(
    [Parameter(Mandatory)][string]$DnsName,
    [string]$Template = "NorthstarWebServer"
)

$inf = @"
[Version]
Signature="$Windows NT$"

[NewRequest]
Subject = "CN=$DnsName"
MachineKeySet = TRUE
KeyLength = 2048
KeySpec = 1
Exportable = FALSE
RequestType = PKCS10
HashAlgorithm = sha256

[Extensions]
2.5.29.17 = "{text}"
_continue_ = "dns=$DnsName"

[RequestAttributes]
CertificateTemplate = $Template
"@

$work = Join-Path $env:TEMP "pki-$([guid]::NewGuid())"
New-Item -ItemType Directory -Path $work | Out-Null
$infPath = Join-Path $work "request.inf"
$reqPath = Join-Path $work "request.req"
$cerPath = Join-Path $work "certificate.cer"

$inf | Set-Content $infPath -Encoding ascii
certreq -new $infPath $reqPath
certreq -submit $reqPath $cerPath
certreq -accept $cerPath

Get-ChildItem Cert:\LocalMachine\My |
    Where-Object Subject -eq "CN=$DnsName" |
    Sort-Object NotAfter -Descending |
    Select-Object -First 1 Subject, Thumbprint, NotAfter
