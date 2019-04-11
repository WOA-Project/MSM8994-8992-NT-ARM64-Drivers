@echo off
cd \
\Windows\OEM\devcon.exe update \Windows\OEM\ChargeArbitration.inf Root\CAD
InfDefaultInstall \Windows\OEM\qcmbb.wp8994.inf
for /f "delims=*" %%f in ('dir /b /s \Windows\System32\DriverStore\FileRepository\qcxhcifilter*.inf') do \Windows\OEM\devcon.exe update %%f URS\QCOM24B6^&HOST
powershell.exe -command "Import-StartLayout -LayoutPath '\Windows\OEM\TaskbarLayoutModification.xml' -MountPath $env:SystemDrive"