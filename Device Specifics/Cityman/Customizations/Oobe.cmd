@echo off
if exist \Windows\OEM\oobe.marker goto :eof
\Windows\OEM\devcon.exe update \Windows\OEM\ChargeArbitration.inf Root\CAD
\Windows\OEM\devcon.exe install \Windows\OEM\oempanel.inf ACPI\MSHW1004
echo. > \Windows\OEM\oobe.marker
shutdown /r /t 0 /f
