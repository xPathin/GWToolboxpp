# GWToolboxpp build script - path and machine agnostic
$ErrorActionPreference = "Stop"

# Resolve repo root from script location
$repoRoot = Split-Path -Parent $MyInvocation.MyCommand.Path

# Find vswhere.exe
$vswhere = "${env:ProgramFiles(x86)}\Microsoft Visual Studio\Installer\vswhere.exe"
if (-not (Test-Path $vswhere)) {
    Write-Error "vswhere.exe not found. Install Visual Studio 2022."
    exit 1
}

# Set up MSVC x86 environment
$vsPath = & $vswhere -latest -requires Microsoft.VisualStudio.Component.VC.Tools.x86.x64 -property installationPath
if (-not $vsPath) {
    Write-Error "Visual Studio with C++ tools not found."
    exit 1
}
Import-Module "$vsPath\Common7\Tools\Microsoft.VisualStudio.DevShell.dll"
Enter-VsDevShell -VsInstallPath $vsPath -DevCmdArguments "-arch=x86" -SkipAutomaticLocation

# Find vcpkg
if (-not $env:VCPKG_ROOT) {
    # Check common locations
    $candidates = @("C:\vcpkg", "$env:USERPROFILE\vcpkg", "${env:ProgramFiles}\vcpkg")
    foreach ($c in $candidates) {
        if (Test-Path "$c\vcpkg.exe") {
            $env:VCPKG_ROOT = $c
            break
        }
    }
}
if (-not $env:VCPKG_ROOT -or -not (Test-Path "$env:VCPKG_ROOT\vcpkg.exe")) {
    Write-Error "vcpkg not found. Set VCPKG_ROOT or install vcpkg."
    exit 1
}

Set-Location $repoRoot

# Generate version string
$short = git rev-parse --short HEAD
$version = "$(Get-Date -UFormat '%Y%m%d')-$short"

Write-Host "Building version: $version"
Write-Host "Repo: $repoRoot"
Write-Host "VCPKG_ROOT: $env:VCPKG_ROOT"
Write-Host "VS: $vsPath"

cmake $repoRoot --preset=vcpkg-ci -DGWTOOLBOXDLL_VERSION="$version"
cmake --build "$repoRoot\build" --target GWToolboxdll

Write-Host "Build complete. Output in $repoRoot\bin\"
