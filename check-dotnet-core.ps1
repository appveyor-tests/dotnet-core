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

if($env:isVs2017 -ne 'true') {
  # VS 2015
  if($netCoreRuntime.Length -ne 14) { throw 'Wrong number of .NET Core runtimes installed' }
  if($netCoreRuntime[0].Name -ne '1.0.0') { throw '.NET Core 1.0.0 not found'}
  if($netCoreRuntime[1].Name -ne '1.0.1') { throw '.NET Core 1.0.1 not found'}
  if($netCoreRuntime[2].Name -ne '1.0.3') { throw '.NET Core 1.0.3 not found'}
  if($netCoreRuntime[3].Name -ne '1.0.4') { throw '.NET Core 1.0.4 not found'}
  if($netCoreRuntime[4].Name -ne '1.0.5') { throw '.NET Core 1.0.5 not found'}
  if($netCoreRuntime[5].Name -ne '1.1.0') { throw '.NET Core 1.1.0 not found'}
  if($netCoreRuntime[6].Name -ne '1.1.1') { throw '.NET Core 1.1.1 not found'}
  if($netCoreRuntime[7].Name -ne '1.1.2') { throw '.NET Core 1.1.2 not found'}
  if($netCoreRuntime[8].Name -ne '2.0.0') { throw '.NET Core 2.0.0 not found'}
  if($netCoreRuntime[9].Name -ne '2.0.3') { throw '.NET Core 2.0.3 not found'}
  if($netCoreRuntime[10].Name -ne '2.0.5') { throw '.NET Core 2.0.5 not found'}
  if($netCoreRuntime[11].Name -ne '2.0.6') { throw '.NET Core 2.0.6 not found'}
  if($netCoreRuntime[12].Name -ne '2.0.7') { throw '.NET Core 2.0.7 not found'}
  if($netCoreRuntime[13].Name -ne '2.1.0') { throw '.NET Core 2.1.0 not found'}
} else {
  # VS 2017
  if($netCoreRuntime.Length -ne 10) { throw 'Wrong number of .NET Core runtimes installed' }
  if($netCoreRuntime[0].Name -ne '1.0.4') { throw '.NET Core 1.0.4 not found'}
  if($netCoreRuntime[1].Name -ne '1.0.5') { throw '.NET Core 1.0.5 not found'}
  if($netCoreRuntime[2].Name -ne '1.1.1') { throw '.NET Core 1.1.1 not found'}
  if($netCoreRuntime[3].Name -ne '1.1.2') { throw '.NET Core 1.1.2 not found'}
  if($netCoreRuntime[4].Name -ne '2.0.0') { throw '.NET Core 2.0.0 not found'}
  if($netCoreRuntime[5].Name -ne '2.0.3') { throw '.NET Core 2.0.3 not found'}
  if($netCoreRuntime[6].Name -ne '2.0.5') { throw '.NET Core 2.0.5 not found'}
  if($netCoreRuntime[7].Name -ne '2.0.6') { throw '.NET Core 2.0.6 not found'}
  if($netCoreRuntime[8].Name -ne '2.0.7') { throw '.NET Core 2.0.7 not found'}
  if($netCoreRuntime[9].Name -ne '2.1.0') { throw '.NET Core 2.1.0 not found'}
}

$netCoreSDK = (Get-ChildItem 'C:\Program Files\dotnet\sdk')
if($env:isVs2017 -ne 'true') {
  # VS 2015
  if($netCoreSDK.Length -ne 16) { throw 'Wrong number of .NET Core SDKs installed' }
  if($netCoreSDK[0].Name -ne '1.0.0-preview2-003121') { throw '.NET Core SDK 1.0.0-preview2-003121 not found'}
  if($netCoreSDK[1].Name -ne '1.0.0-preview2-003131') { throw '.NET Core SDK 1.0.0-preview2-003131 not found'}
  if($netCoreSDK[2].Name -ne '1.0.0-preview2-003156') { throw '.NET Core SDK 1.0.0-preview2-003156 not found'}
  if($netCoreSDK[3].Name -ne '1.0.0-preview2-1-003177') { throw '.NET Core SDK 1.0.0-preview2-1-003177 not found'}
  if($netCoreSDK[4].Name -ne '1.0.1') { throw '.NET Core SDK 1.0.1 not found'}
  if($netCoreSDK[5].Name -ne '1.0.4') { throw '.NET Core SDK 1.0.4 not found'}
  if($netCoreSDK[6].Name -ne '2.0.0') { throw '.NET Core SDK 2.0.0 not found'}
  if($netCoreSDK[7].Name -ne '2.0.3') { throw '.NET Core SDK 2.0.3 not found'}
  if($netCoreSDK[8].Name -ne '2.1.101') { throw '.NET Core SDK 2.1.101 not found'}
  if($netCoreSDK[9].Name -ne '2.1.103') { throw '.NET Core SDK 2.1.103 not found'}
  if($netCoreSDK[10].Name -ne '2.1.104') { throw '.NET Core SDK 2.1.104 not found'}
  if($netCoreSDK[11].Name -ne '2.1.105') { throw '.NET Core SDK 2.1.105 not found'}
  if($netCoreSDK[12].Name -ne '2.1.200') { throw '.NET Core SDK 2.1.200 not found'}
  if($netCoreSDK[13].Name -ne '2.1.300') { throw '.NET Core SDK 2.1.300 not found'}
  if($netCoreSDK[14].Name -ne '2.1.4') { throw '.NET Core SDK 2.1.4 not found'}
} else {
  # VS 2017
  if($netCoreSDK.Length -ne 19) { throw 'Wrong number of .NET Core SDKs installed' }
  if($netCoreSDK[0].Name -ne '1.0.1') { throw '.NET Core SDK 1.0.1 not found'}
  if($netCoreSDK[1].Name -ne '1.0.2') { throw '.NET Core SDK 1.0.2 not found'}
  if($netCoreSDK[2].Name -ne '1.0.3') { throw '.NET Core SDK 1.0.3 not found'}
  if($netCoreSDK[3].Name -ne '1.0.4') { throw '.NET Core SDK 1.0.4 not found'}
  if($netCoreSDK[4].Name -ne '1.1.0') { throw '.NET Core SDK 1.1.0 not found'}
  if($netCoreSDK[5].Name -ne '2.0.0') { throw '.NET Core SDK 2.0.0 not found'}
  if($netCoreSDK[6].Name -ne '2.0.2') { throw '.NET Core SDK 2.0.2 not found'}
  if($netCoreSDK[7].Name -ne '2.0.3') { throw '.NET Core SDK 2.0.3 not found'}
  if($netCoreSDK[8].Name -ne '2.1.100') { throw '.NET Core SDK 2.1.100 not found'}
  if($netCoreSDK[9].Name -ne '2.1.101') { throw '.NET Core SDK 2.1.101 not found'}
  if($netCoreSDK[10].Name -ne '2.1.103') { throw '.NET Core SDK 2.1.103 not found'}
  if($netCoreSDK[11].Name -ne '2.1.104') { throw '.NET Core SDK 2.1.104 not found'}
  if($netCoreSDK[12].Name -ne '2.1.105') { throw '.NET Core SDK 2.1.105 not found'}
  if($netCoreSDK[13].Name -ne '2.1.2') { throw '.NET Core SDK 2.1.2 not found'}
  if($netCoreSDK[14].Name -ne '2.1.200') { throw '.NET Core SDK 2.1.200 not found'}
  if($netCoreSDK[15].Name -ne '2.1.201') { throw '.NET Core SDK 2.1.201 not found'}
  if($netCoreSDK[16].Name -ne '2.1.300') { throw '.NET Core SDK 2.1.300 not found'}
  if($netCoreSDK[17].Name -ne '2.1.4') { throw '.NET Core SDK 2.1.4 not found'}
}
