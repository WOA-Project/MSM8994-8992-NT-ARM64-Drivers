@echo off

REM NFC
powershell -command "[System.Environment]::OSVersion.Version.Build" > psout.txt
set /p osbuild=<psout.txt
del psout.txt

set ossupport=1803
if %osbuild% gtr 17134 set ossupport=1809
if %osbuild% gtr 17763 set ossupport=1903

copy \Windows\OEM\MSNfcI2C547.%ossupport%.dll \Windows\OEM\MSNfcI2C547.dll
copy \Windows\OEM\nxppn547.%ossupport%.cat \Windows\OEM\nxppn547.cat

\Windows\OEM\devcon.exe update \Windows\OEM\oempanel.inf ACPI\MSHW1004