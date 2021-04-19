@echo off

setlocal enabledelayedexpansion
set type=%1

for %%x in (xenbus, xencons, xenhid, xeniface, xennet, xenvbd, xenvif, xenvkbd, xenvusb, xenusbdevice, ivc, pv-display-helper, glasswddm) do (
 pushd %%x
 powershell ./build.ps1 %type% x64
 set err=!errorlevel!
 popd
 if !err! neq 0 goto :eof
)

set type=%type:checked=Debug%
set type=%type:free=Release%

msbuild.exe -p:Configuration=%type% -p:Platform=x64
