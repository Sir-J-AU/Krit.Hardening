<#
.SYNOPSIS
    Krit.Hardening - Kritical Hardening toolkit (audit-only in v1.0.0).
.AUTHOR
    Joshua Finley - Kritical Pty Ltd - https://kritical.net
#>

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$here = Split-Path -Parent $PSCommandPath
foreach ($dir in 'Private','Public') {
    $folder = Join-Path $here $dir
    if (Test-Path -LiteralPath $folder) {
        Get-ChildItem -LiteralPath $folder -Filter '*.ps1' -File | Sort-Object Name | ForEach-Object {
            . $_.FullName
        }
    }
}

Export-ModuleMember -Function @(
    'Test-KritHardenPrereqs',
    'Install-KritHardenModules',
    'Get-KritHardenModuleStatus',
    'Test-KritHardenCompliance',
    'New-KritHardenReport',
    'Get-KritHardenBanner'
)
