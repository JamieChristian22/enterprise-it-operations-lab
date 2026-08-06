$required = @(
    "README.md",
    "configuration/CAPolicy.inf",
    "documentation/offline-root-ca-build.md",
    "documentation/issuing-ca-build.md",
    "documentation/aia-cdp-crl-configuration.md",
    "documentation/ocsp-deployment.md"
)

$failed = $false
foreach ($item in $required) {
    if (Test-Path $item) {
        Write-Host "PASS $item"
    } else {
        Write-Error "Missing $item"
        $failed = $true
    }
}
if ($failed) { exit 1 }
