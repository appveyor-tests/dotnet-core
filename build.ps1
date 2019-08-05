$env:dotnetcore_version = '2.2.301'
$env:isVs2017 = 'false'
if (test-path "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community") { $env:isVs2017 = 'true' }
$result = (cmd /c dotnet new console)
$result
if ($result[1] -eq 'Welcome to .NET Core!') { throw "Welcome to .NET Core message found!" }
.\check-dotnet-core.ps1
test.cmd
