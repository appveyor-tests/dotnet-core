$core_version = (dotnet --version)
Write-Host "Installed .NET Core: $core_version"
if($core_version -ne $env:dotnetcore_version) { throw "Expected .NET Core: $env:dotnetcore_version, actual: $core_version"; }

Write-Host "Creating new app to see if .NET Core runtime pre-cached"
Write-Host "md myapp; cd myapp; dotnet new"
md myapp; cd myapp
$core_new_app = (dotnet new console)
$core_new_app
#if($core_new_app -ne "Created new C# project in $env:appveyor_build_folder\myapp.") { throw '.NET Core installation must be pre-cached.'; }
cd..

$dotnet_runtimes = @{
  '1.0.0' = @{ vs2015 = $true }
  '1.0.1' = @{ vs2015 = $true }
  '1.0.3' = @{ vs2015 = $true }
  '1.0.4' = @{ vs2015 = $true; vs2017 = $true }
  '1.0.5' = @{ vs2015 = $true; vs2017 = $true }
  '1.1.0' = @{ vs2015 = $true; }
  '1.1.1' = @{ vs2015 = $true; vs2017 = $true }
  '1.1.2' = @{ vs2015 = $true; vs2017 = $true }
  '2.0.0' = @{ vs2015 = $true; vs2017 = $true }
  '2.0.3' = @{ vs2015 = $true; vs2017 = $true }
  '2.0.5' = @{ vs2015 = $true; vs2017 = $true }
  '2.0.6' = @{ vs2015 = $true; vs2017 = $true }
  '2.0.7' = @{ vs2015 = $true; vs2017 = $true }
  '2.1.0' = @{ vs2015 = $true; vs2017 = $true }
  '2.1.1' = @{ vs2015 = $true; vs2017 = $true }
  '2.1.2' = @{ vs2015 = $true; vs2017 = $true }
  '2.1.3' = @{ vs2015 = $true; vs2017 = $true }
  '2.1.4' = @{ vs2015 = $true; vs2017 = $true }
  '2.1.5' = @{ vs2015 = $true; vs2017 = $true }
}

$dotnet_sdks = @{
  '1.0.0-preview2-003121'   = @{ vs2015 = $true }
  '1.0.0-preview2-003131'   = @{ vs2015 = $true }
  '1.0.0-preview2-003156'   = @{ vs2015 = $true }
  '1.0.0-preview2-1-003177' = @{ vs2015 = $true }
  '1.0.1'   = @{ vs2015 = $true; vs2017 = $true }
  '1.0.2'   = @{ vs2017 = $true }
  '1.0.3'   = @{ vs2017 = $true }
  '1.0.4'   = @{ vs2015 = $true; vs2017 = $true }
  '1.1.0'   = @{ vs2017 = $true }
  '2.0.0'   = @{ vs2015 = $true; vs2017 = $true }
  '2.0.2'   = @{ vs2017 = $true }
  '2.0.3'   = @{ vs2015 = $true; vs2017 = $true }
  '2.1.2'   = @{ vs2017 = $true }
  '2.1.4'   = @{ vs2015 = $true; vs2017 = $true }
  '2.1.100' = @{ vs2017 = $true }
  '2.1.101' = @{ vs2015 = $true; vs2017 = $true }
  '2.1.103' = @{ vs2015 = $true; vs2017 = $true }
  '2.1.104' = @{ vs2015 = $true; vs2017 = $true }
  '2.1.105' = @{ vs2015 = $true; vs2017 = $true }
  '2.1.200' = @{ vs2015 = $true; vs2017 = $true }
  '2.1.201' = @{ vs2017 = $true }
  '2.1.300' = @{ vs2015 = $true; vs2017 = $true }
  '2.1.301' = @{ vs2015 = $true; vs2017 = $true }
  '2.1.302' = @{ vs2015 = $true; vs2017 = $true }
  '2.1.400' = @{ vs2015 = $true; vs2017 = $true }
  '2.1.401' = @{ vs2015 = $true; vs2017 = $true }
  '2.1.402' = @{ vs2015 = $true; vs2017 = $true }
  '2.1.403' = @{ vs2015 = $true; vs2017 = $true }
}

# check runtimes
$vsVer = 'vs2015'
if ($env:isVs2017 -eq 'true') {
  $vsVer = 'vs2017'
}

Write-Host "Checking installed .NET Core runtimes" -ForegroundColor Cyan
foreach($runtime_ver in $dotnet_runtimes.Keys) {
    if ($dotnet_runtimes[$runtime_ver][$vsVer] -and `
        -not (Test-Path "C:\Program Files\dotnet\shared\Microsoft.NETCore.App\$runtime_ver")) {
        throw ".NET Core Runtime $runtime_ver not found"
    } else {
      Write-Host "$runtime_ver - installed"
    }
}

#check SDKs
Write-Host "Checking installed .NET Core SDKs" -ForegroundColor Cyan
foreach($sdk_ver in $dotnet_sdks.Keys) {
    if ($dotnet_sdks[$sdk_ver][$vsVer] -and `
        -not (Test-Path "C:\Program Files\dotnet\sdk\$sdk_ver")) {
        throw ".NET Core SDK $sdk_ver not found"
    } else {
      Write-Host "$sdk_ver - installed"
    }
}

Write-Host ".NET Core runtimes and SDKs are good" -ForegroundColor Green
