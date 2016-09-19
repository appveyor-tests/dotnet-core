$core_version = (dotnet --version)
Write-Host "Installed .NET Core: $core_version"
if($core_version -ne $env:dotnetcore_version) { throw "Expected .NET Core: $env:dotnetcore_version, actual: $core_version"; }

Write-Host "Creating new app to see if .NET Core runtime pre-cached"
Write-Host "md myapp; cd myapp; dotnet new"
md myapp; cd myapp
$core_new_app = (dotnet new)
$core_new_app
if($core_new_app -ne "Created new C# project in $env:appveyor_build_folder\myapp.") { throw '.NET Core installation must be pre-cached.'; }
cd..
