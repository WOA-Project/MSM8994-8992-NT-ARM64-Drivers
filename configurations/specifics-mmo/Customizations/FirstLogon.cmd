@echo off

REM System apps
dism.exe /Online /Add-ProvisioningPackage /PackagePath:%SystemDrive%\Windows\Provisioning\Packages\OEMApps.ppkg
powershell -ExecutionPolicy Bypass -File \Windows\OEM\OEMApps.ps1