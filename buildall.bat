@echo off

set type=%1

for %%x in (xenbus, xenvusb, xenusbdevice) do (
 pushd %%x
 powershell ./build.ps1 %type%
 popd
)

set type=%type:checked=Debug%
set type=%type:free=Release%

msbuild.exe -p:Configuration=%type% -p:Platform=x64
