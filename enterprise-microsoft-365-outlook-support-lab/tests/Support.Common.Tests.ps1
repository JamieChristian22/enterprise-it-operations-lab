BeforeAll {
    $modulePath = Join-Path $PSScriptRoot "..\scripts\modules\Support.Common.psm1"
    Import-Module $modulePath -Force
}

Describe "Support.Common module" {
    It "creates a timestamped output directory" {
        $base = Join-Path $TestDrive "output"
        New-Item -ItemType Directory -Path $base | Out-Null

        $result = New-SupportOutputDirectory -BasePath $base -Prefix "TestRun"

        Test-Path $result | Should -BeTrue
        Split-Path $result -Leaf | Should -Match "^TestRun-\d{8}-\d{6}$"
    }

    It "writes a log line when a log path is supplied" {
        $log = Join-Path $TestDrive "support.log"

        Write-SupportLog -Message "Unit test message" -Level INFO -LogPath $log

        Test-Path $log | Should -BeTrue
        Get-Content $log | Should -Match "Unit test message"
    }

    It "returns a Boolean for administrator status" {
        (Test-Administrator).GetType().Name | Should -Be "Boolean"
    }
}
