Describe 'EnterpriseBaseline configuration' {
 It 'defines the baseline configuration' { Test-Path "$PSScriptRoot\..\configurations\EnterpriseBaseline.ps1" | Should -BeTrue }
 It 'removes Telnet Client' { (Get-Content "$PSScriptRoot\..\configurations\EnterpriseBaseline.ps1" -Raw) | Should -Match "Ensure='Absent'" }
 It 'enables script block logging' { (Get-Content "$PSScriptRoot\..\configurations\EnterpriseBaseline.ps1" -Raw) | Should -Match 'EnableScriptBlockLogging' }
}
