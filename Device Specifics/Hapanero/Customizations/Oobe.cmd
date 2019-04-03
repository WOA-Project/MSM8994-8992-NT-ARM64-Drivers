@echo off
for /f "delims=*" %%f in ('dir /b /s \Windows\System32\DriverStore\FileRepository\msnfc*.inf') do \Windows\OEM\devcon.exe update %%f ACPI\PN547
for /f "delims=*" %%f in ('dir /b /s \Windows\System32\DriverStore\FileRepository\NXPP*.inf') do \Windows\OEM\devcon.exe update %%f ACPI\PN547
powershell.exe -command "Import-StartLayout -LayoutPath '\Windows\OEM\TaskbarLayoutModification.xml' -MountPath $env:SystemDrive"