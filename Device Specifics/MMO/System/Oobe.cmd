@echo off
cd \
\Windows\OEM\devcon.exe update \Windows\OEM\ChargeArbitration.inf Root\CAD
for /f "delims=*" %%f in ('dir /b /s \Windows\System32\DriverStore\FileRepository\qcxhcifilter*.inf') do \Windows\OEM\devcon.exe update %%f URS\QCOM24B6^&HOST