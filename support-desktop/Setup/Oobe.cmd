@echo off

REM Second boot drivers
\Windows\OEM\devcon.exe update \Windows\OEM\ChargeArbitration.inf Root\CAD
\Windows\OEM\devcon.exe update \Windows\OEM\qcmbb.wp8994.inf QCMS\QCOM0EA0
for /f "delims=*" %%f in ('dir /b /s \Windows\System32\DriverStore\FileRepository\qcxhcifilter*.inf') do \Windows\OEM\devcon.exe update %%f URS\QCOM24B6^&HOST

call \Windows\OEM\IHVDriversOobe.cmd