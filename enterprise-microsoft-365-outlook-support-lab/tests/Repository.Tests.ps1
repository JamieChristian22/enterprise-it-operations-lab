BeforeAll {
    $repoRoot = Resolve-Path (Join-Path $PSScriptRoot "..")
}

Describe "Repository quality" {
    It "contains required portfolio documents" {
        $required = @(
            "README.md",
            "docs\04-incident-report.md",
            "docs\05-root-cause-analysis.md",
            "docs\09-knowledge-base-outlook-will-not-open.md",
            "tickets\INC-10487-conversation.md",
            "scripts\Invoke-OutlookSupportBundle.ps1"
        )

        foreach ($relativePath in $required) {
            Test-Path (Join-Path $repoRoot $relativePath) | Should -BeTrue
        }
    }

    It "contains no unfinished authoring markers" {
        $files = Get-ChildItem $repoRoot -Recurse -File |
            Where-Object Extension -In ".md", ".ps1", ".psm1", ".txt", ".csv"

        $content = ($files | Get-Content -Raw) -join "`n"
        $content | Should -Not -Match "\bTODO\b|\bTBD\b|lorem\s+ipsum"
    }
}
