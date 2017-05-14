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

(Get-ChildItem 'C:\Program Files\dotnet\shared\Microsoft.NETCore.App')
(Get-ChildItem 'C:\Program Files\dotnet\sdk')

$netCoreRuntime = (Get-ChildItem 'C:\Program Files\dotnet\shared\Microsoft.NETCore.App')
if($netCoreRuntime.Length -ne 8) { throw 'Wrong number of .NET Core runtimes installed' }
if($netCoreRuntime[0].Name -ne '1.0.0') { throw '.NET Core 1.0.0 not found'}
if($netCoreRuntime[1].Name -ne '1.0.1') { throw '.NET Core 1.0.1 not found'}
if($netCoreRuntime[2].Name -ne '1.0.3') { throw '.NET Core 1.0.3 not found'}
if($netCoreRuntime[3].Name -ne '1.0.4') { throw '.NET Core 1.0.4 not found'}
if($netCoreRuntime[4].Name -ne '1.0.5') { throw '.NET Core 1.0.5 not found'}
if($netCoreRuntime[5].Name -ne '1.1.0') { throw '.NET Core 1.1.0 not found'}
if($netCoreRuntime[6].Name -ne '1.1.1') { throw '.NET Core 1.1.1 not found'}
if($netCoreRuntime[7].Name -ne '1.1.2') { throw '.NET Core 1.1.2 not found'}

$netCoreSDK = (Get-ChildItem 'C:\Program Files\dotnet\sdk')
if($netCoreSDK.Length -ne 6) { throw 'Wrong number of .NET Core SDKs installed' }
if($netCoreSDK[0].Name -ne '1.0.0-preview2-003121') { throw '.NET Core SDK 1.0.0-preview2-003121 not found'}
if($netCoreSDK[1].Name -ne '1.0.0-preview2-003131') { throw '.NET Core SDK 1.0.0-preview2-003131 not found'}
if($netCoreSDK[2].Name -ne '1.0.0-preview2-003156') { throw '.NET Core SDK 1.0.0-preview2-003156 not found'}
if($netCoreSDK[3].Name -ne '1.0.0-preview2-1-003177') { throw '.NET Core SDK 1.0.0-preview2-1-003177 not found'}
if($netCoreSDK[4].Name -ne '1.0.1') { throw '.NET Core SDK 1.0.1 not found'}
if($netCoreSDK[5].Name -ne '1.0.4') { throw '.NET Core SDK 1.0.4 not found'}