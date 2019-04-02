@echo off
\Windows\OEM\devcon.exe update \Windows\OEM\ChargeArbitration.inf Root\CAD
powershell.exe -command "Import-StartLayout -LayoutPath \\Windows\\OEM\\TaskbarLayoutModification.xml -MountPath $env:SystemDrive\\"