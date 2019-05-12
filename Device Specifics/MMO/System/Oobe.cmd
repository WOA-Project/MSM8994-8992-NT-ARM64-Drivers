@echo off
cd \
\Windows\OEM\devcon.exe update \Windows\OEM\oempanel.inf ACPI\MSHW1004
REM for /f "delims=*" %%f in ('dir /b /s \Windows\System32\DriverStore\FileRepository\qcdx*.inf') do \Windows\OEM\devcon.exe update %%f ACPI\QCOM246F
\Windows\OEM\devcon.exe update \Windows\OEM\qcmbb.wp8994.inf QCMS\QCOM0EA0
\Windows\OEM\devcon.exe update \Windows\OEM\ChargeArbitration.inf Root\CAD
for /f "delims=*" %%f in ('dir /b /s \Windows\System32\DriverStore\FileRepository\qcxhcifilter*.inf') do \Windows\OEM\devcon.exe update %%f URS\QCOM24B6^&HOST