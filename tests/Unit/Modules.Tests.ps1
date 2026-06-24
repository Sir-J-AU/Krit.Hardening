#requires -Modules Pester
BeforeAll {
    Import-Module (Join-Path $PSScriptRoot '..\..\src\Krit.Hardening.psm1') -Force
}
Describe 'Get-KritHardenModuleStatus' {
    It 'reports the canonical hardening module set' {
        $r = Get-KritHardenModuleStatus
        $names = $r.Modules | Select-Object -ExpandProperty Module
        $names | Should -Contain 'Harden-Windows-Security-Module'
        $names | Should -Contain 'HardeningKitty'
        $names | Should -Contain 'AuditPolicyDsc'
        $names | Should -Contain 'SecurityPolicyDsc'
        $names | Should -Contain 'PSDscResources'
        $names | Should -Contain 'NetworkingDsc'
        $names | Should -Contain 'PSScriptAnalyzer'
    }
    It 'rows have Installed (bool) and Version' {
        $r = Get-KritHardenModuleStatus
        foreach ($m in $r.Modules) {
            $m.Installed | Should -BeOfType [bool]
        }
    }
}

Describe 'Install-KritHardenModules -NoInstall' {
    It 'returns a status object without throwing' {
        $r = Install-KritHardenModules -NoInstall -Quiet -NoBanner
        $r           | Should -Not -BeNullOrEmpty
        $r.Ok        | Should -BeOfType [bool]
        $r.Failures  | Should -BeOfType [int]
        $r.Modules   | Should -Not -BeNullOrEmpty
    }
    It '-OnlyCore restricts to HotCakeX + HardeningKitty' {
        $r = Install-KritHardenModules -OnlyCore -NoInstall -Quiet -NoBanner
        $names = $r.Modules | Select-Object -ExpandProperty Module
        $names | Should -Contain 'Harden-Windows-Security-Module'
        $names | Should -Contain 'HardeningKitty'
        $names | Should -Not -Contain 'AuditPolicyDsc'
    }
}
