$core_version = (dotnet --version)
if($core_version -ne $env:dotnetcore_version) { throw "Expected .NET Core: $env:dotnetcore_version, actual: $core_version"; }
md myapp; cd myapp
$core_new_app = (dotnet new)
if($core_new_app -ne "Created new C# project in $env:appveyor_build_folder\myapp.") { throw '.NET Core installation must be pre-cached.'; }
cd..
