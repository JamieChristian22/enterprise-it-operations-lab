$required = @(
    "README.md",
    "executive/monthly-executive-operations-report.md",
    "operations/weekly-infrastructure-health-report.md",
    "patching/patch-compliance-summary.md",
    "capacity/capacity-planning-report.md",
    "security/security-events-summary.md"
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
