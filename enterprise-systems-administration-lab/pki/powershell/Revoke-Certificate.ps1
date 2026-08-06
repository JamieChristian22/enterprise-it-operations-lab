#Requires -Version 5.1
[CmdletBinding(SupportsShouldProcess)]
param(
    [Parameter(Mandatory)][int]$RequestId,
    [ValidateSet("Unspecified","KeyCompromise","CACompromise","AffiliationChanged","Superseded","CessationOfOperation","CertificateHold")]
    [string]$Reason = "Unspecified"
)

$reasonMap = @{
    Unspecified = 0
    KeyCompromise = 1
    CACompromise = 2
    AffiliationChanged = 3
    Superseded = 4
    CessationOfOperation = 5
    CertificateHold = 6
}

if ($PSCmdlet.ShouldProcess("Request ID $RequestId", "Revoke certificate")) {
    certutil -revoke $RequestId $reasonMap[$Reason]
    if ($LASTEXITCODE -ne 0) {
        throw "Certificate revocation failed."
    }
    certutil -crl
}
