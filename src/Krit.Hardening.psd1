@{
    RootModule        = 'Krit.Hardening.psm1'
    ModuleVersion     = '1.0.0'
    GUID              = 'd4e5f6a7-8b9c-4d1e-9f2a-3b4c5d6e7f80'
    Author            = 'Joshua Finley'
    CompanyName       = 'Kritical Pty Ltd'
    Copyright         = '(c) 2026 Kritical Pty Ltd. All rights reserved.'
    Description       = 'Kritical Hardening toolkit. Stands on the shoulders of HotCakeX/Harden-Windows-Security-Module, scipag/HardeningKitty, Microsoft Security Compliance Toolkit, and the DSC AuditPolicy/SecurityPolicy resources. v1.0.0 is audit-only: a single call runs every installed compliance probe and emits a Kritical-branded HTML + Excel report. Apply-side functions (Invoke-KritHardenApply / Restore-KritHardenSnapshot / Start-KritHardenWatcher) ship in v1.1.0 once the snapshot/rollback chain is bulletproof. Built on Krit.OmniFramework.'
    PowerShellVersion = '5.1'
    CompatiblePSEditions = @('Desktop','Core')

    RequiredModules   = @(
        @{ ModuleName = 'Krit.OmniFramework'; ModuleVersion = '1.0.1' }
    )

    FunctionsToExport = @(
        'Test-KritHardenPrereqs',
        'Install-KritHardenModules',
        'Get-KritHardenModuleStatus',
        'Test-KritHardenCompliance',
        'New-KritHardenReport',
        'Get-KritHardenBanner'
    )
    CmdletsToExport   = @()
    VariablesToExport = @()
    AliasesToExport   = @()

    PrivateData = @{
        PSData = @{
            Tags         = @('Kritical','Hardening','Security','HotCakeX','HardeningKitty','MicrosoftSecurityComplianceToolkit','LGPO','DSC','CIS','STIG','Windows','MSP','Automation')
            LicenseUri   = 'https://kritical.net/legal/license'
            ProjectUri   = 'https://github.com/Sir-J-AU/Krit.Hardening'
            IconUri      = 'https://kritical.net/assets/horizontal_logo.png'
            ReleaseNotes = @'
1.0.0 - Initial release (audit-only).
  * Test-KritHardenPrereqs        - 7-gate prereq check (OS / PS / admin / Defender / TPM / SecureBoot / WinRM)
  * Install-KritHardenModules     - wraps Install-Module for HotCakeX Harden-Windows-Security-Module + scipag HardeningKitty; honours the operator's existing module versions
  * Test-KritHardenCompliance     - runs every installed audit tool, normalises findings into a single PSCustomObject set + JSON
  * New-KritHardenReport          - Kritical-branded HTML + Excel via Krit.OmniFramework (sister module)
  * Pester unit tests, brand discipline, no destructive apply path in this version
  * Stands on Krit.OmniFramework 1.0.1+
  * Joshua Finley, Kritical Pty Ltd
'@
        }
    }
}
