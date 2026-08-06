BeforeAll {
    $projectRoot = Split-Path $PSScriptRoot -Parent
    $scriptRoot = Join-Path $projectRoot 'powershell'
    $requiredScripts = @(
        'Get-ServerHealth.ps1',
        'Test-WindowsServerBaseline.ps1',
        'Test-BackupFreshness.ps1',
        'Install-RequiredRoles.ps1',
        'New-DepartmentShares.ps1',
        'Get-FailedServices.ps1',
        'Get-EventLogSummary.ps1'
    )
}
Describe 'Repository completeness' {
    It 'contains every required PowerShell script' -ForEach $requiredScripts {
        Test-Path (Join-Path $scriptRoot $_) | Should -BeTrue
    }
    It 'contains the security baseline' {
        Test-Path (Join-Path $projectRoot 'configuration\security-baseline.md') | Should -BeTrue
    }
    It 'contains evidence for build, baseline, file services, and restore' {
        @('server-build-validation.txt','security-baseline-validation.txt','file-services-validation.txt','backup-and-restore-validation.txt') | ForEach-Object {
            Test-Path (Join-Path $projectRoot "evidence\$_") | Should -BeTrue
        }
    }
}
Describe 'PowerShell quality gates' {
    It 'parses without syntax errors' -ForEach $requiredScripts {
        $tokens=$null; $errors=$null
        [void][System.Management.Automation.Language.Parser]::ParseFile((Join-Path $scriptRoot $_),[ref]$tokens,[ref]$errors)
        $errors.Count | Should -Be 0
    }
    It 'contains comment-based help' -ForEach @('Get-ServerHealth.ps1','Test-WindowsServerBaseline.ps1','Test-BackupFreshness.ps1','Install-RequiredRoles.ps1','New-DepartmentShares.ps1') {
        (Get-Help (Join-Path $scriptRoot $_)).Synopsis | Should -Not -BeNullOrEmpty
    }
}
Describe 'Configuration data' {
    It 'defines four unique servers' {
        $inventory = Import-Csv (Join-Path $projectRoot 'configuration\server-inventory.csv')
        $inventory.Count | Should -Be 4
        ($inventory.Server | Select-Object -Unique).Count | Should -Be 4
    }
    It 'defines no direct user permissions in the share matrix' {
        $matrix = Import-Csv (Join-Path $projectRoot 'configuration\share-permission-matrix.csv')
        ($matrix.ReadWriteGroup -join ',') | Should -Match 'GG_'
        ($matrix.ReadOnlyGroup -join ',') | Should -Not -Match '@'
    }
}
