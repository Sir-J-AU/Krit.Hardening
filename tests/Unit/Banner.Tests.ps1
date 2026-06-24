#requires -Modules Pester
BeforeAll {
    Import-Module (Join-Path $PSScriptRoot '..\..\src\Krit.Hardening.psm1') -Force
}
Describe 'Get-KritHardenBanner' {
    It 'returns a string with Kritical brand' {
        $b = Get-KritHardenBanner
        $b | Should -Match 'Kritical'
    }
    It '-Compact returns one-line summary' {
        $b = Get-KritHardenBanner -Compact
        $b | Should -Match 'Kritical'
    }
    It '-Title appends title block when not Compact' {
        (Get-KritHardenBanner -Title 'UnitTest') | Should -Match 'UnitTest'
    }
}
