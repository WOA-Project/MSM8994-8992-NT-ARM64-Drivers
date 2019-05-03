@echo off
dism.exe /Add-AppxPackage /PackagePath:%SystemDrive%\Windows\OEM\CommsPhone.appxbundle
powershell.exe -command "cd \;Import-StartLayout -LayoutPath '\Windows\OEM\TaskbarLayoutModification.xml' -MountPath $env:SystemDrive"