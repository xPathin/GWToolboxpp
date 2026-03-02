# gwca-decompile build script
$ErrorActionPreference = "Stop"

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$buildDir = Join-Path $scriptDir "build"

# Find vcpkg BEFORE Enter-VsDevShell (which may set its own VCPKG_ROOT)
$vcpkgPath = $null
$candidates = @("C:\vcpkg", "$env:USERPROFILE\vcpkg", "${env:ProgramFiles}\vcpkg")
foreach ($c in $candidates) {
    if (Test-Path "$c\vcpkg.exe") {
        $vcpkgPath = $c
        break
    }
}
if (-not $vcpkgPath) {
    Write-Error "vcpkg not found at C:\vcpkg. Install vcpkg."
    exit 1
}

# Find VS and set up MSVC x86 environment
$vswhere = "${env:ProgramFiles(x86)}\Microsoft Visual Studio\Installer\vswhere.exe"
if (-not (Test-Path $vswhere)) {
    Write-Error "vswhere.exe not found. Install Visual Studio 2022."
    exit 1
}
$vsPath = & $vswhere -latest -requires Microsoft.VisualStudio.Component.VC.Tools.x86.x64 -property installationPath
if (-not $vsPath) {
    Write-Error "Visual Studio with C++ tools not found."
    exit 1
}
Import-Module "$vsPath\Common7\Tools\Microsoft.VisualStudio.DevShell.dll"
Enter-VsDevShell -VsInstallPath $vsPath -DevCmdArguments "-arch=x86" -SkipAutomaticLocation

# Touch git-modified files to fix Syncthing timestamps
$repoRoot = Resolve-Path (Join-Path $scriptDir "..\..\..") -ErrorAction SilentlyContinue
if ($repoRoot -and (Test-Path (Join-Path $repoRoot ".git"))) {
    Push-Location $repoRoot
    $dirty = git diff --name-only HEAD 2>$null
    if ($dirty) {
        $dirty | ForEach-Object {
            $f = Join-Path $repoRoot $_
            if (Test-Path $f) { (Get-Item $f).LastWriteTime = Get-Date }
        }
    }
    Pop-Location
}

Write-Host "vcpkg: $vcpkgPath"
Write-Host "VS: $vsPath"
Write-Host "Build dir: $buildDir"

Set-Location $scriptDir

cmake -B $buildDir -G Ninja `
    "-DCMAKE_TOOLCHAIN_FILE=$vcpkgPath\scripts\buildsystems\vcpkg.cmake" `
    -DVCPKG_TARGET_TRIPLET=x86-windows-static `
    -DCMAKE_BUILD_TYPE=Release

cmake --build $buildDir

$dll = Join-Path $buildDir "bin\gwca.dll"
if (Test-Path $dll) {
    $size = (Get-Item $dll).Length
    Write-Host "`nBuild successful: gwca.dll ($size bytes)"
} else {
    Write-Error "Build failed: gwca.dll not found"
    exit 1
}
