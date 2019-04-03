@echo off
for /f "delims=*" %%f in ('dir /b /s \Windows\System32\DriverStore\FileRepository\qcxhcifilter*.inf') do \Windows\OEM\devcon.exe update %%f ACPI\QCOM24B6^&HOST
powershell.exe -command "Import-StartLayout -LayoutPath '\Windows\OEM\TaskbarLayoutModification.xml' -MountPath $env:SystemDrive"