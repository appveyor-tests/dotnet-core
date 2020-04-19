Get-ChildItem "C:\Program Files\dotnet\sdk"

$core_version = (dotnet --version)
Write-Host "Installed .NET Core: $core_version"
if($core_version -ne $env:dotnetcore_version) { throw "Expected .NET Core: $env:dotnetcore_version, actual: $core_version"; }

$dotnet_sdks = @(
  '1.1.14'
  '2.1.803'
  '2.2.402'
  '3.0.102'
  '3.1.201'
)

if ($env:vs_version -eq 'vs2017') {
  $dotnet_sdks = @(
    ''
  )
} elseif ($env:vs_version -eq 'vs2015') {
  $dotnet_sdks = @(
    ''
  )
}

foreach($dotnet_sdk in $dotnet_sdks) {
    if (-not (Test-Path "$env:ProgramFiles\dotnet\sdk\$sdkVersion")) {
        throw ".NET Core SDK $sdkVersion is not installed"
    } else {
        Write-Host "Checking .NET Core SDK $sdkVersion"
    }

    $projectPath = "$env:temp\TestApp"
    New-Item -Path $projectPath -Force -ItemType Directory | Out-Null
    Set-Content -Path "$projectPath\global.json" -Value "{`"sdk`": {`"version`": `"$sdkVersion`"}}"
    Push-Location -Path $projectPath
    $result = (& $env:ProgramFiles\dotnet\dotnet.exe new console) -join "`n"
    if ($result.contains('Welcome to .NET Core!')) {
      throw ".NET Core is not warmed up!"
    }
    Pop-Location
    Remove-Item $projectPath -Force -Recurse
    Write-Host "Installed .NET Core SDK $sdkVersion" -ForegroundColor Green
}

Write-Host ".NET Core runtimes and SDKs are good" -ForegroundColor Green
