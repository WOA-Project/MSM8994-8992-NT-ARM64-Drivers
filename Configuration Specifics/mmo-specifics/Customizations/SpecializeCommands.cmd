@echo off

REM Put a notice

title Post installation configuration
echo.
echo Configuring device for initial boot...
echo Please do not close or tap or touch or interact with this window, this may take a while.
echo.

REM Device id configuration
REG ADD "HKLM\SOFTWARE\WowAA32Node\Microsoft\Windows\CurrentVersion\Internet Settings\Configuration" /v PartnerSearchCode /t REG_SZ /d NOKMSB /f

REM Battery slider
powercfg /setdcvalueindex OVERLAY_SCHEME_HIGH SUB_PROCESSOR PERFEPP 50
powercfg /setacvalueindex OVERLAY_SCHEME_HIGH SUB_PROCESSOR PERFEPP 33
powercfg /setdcvalueindex OVERLAY_SCHEME_MAX SUB_PROCESSOR PERFEPP 33
powercfg /setacvalueindex OVERLAY_SCHEME_MAX SUB_PROCESSOR PERFEPP 25

REM Disable fast startup as this is not supported by firmware and will cause issues
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v HiberbootEnabled /t REG_DWORD /d 0 /f

REM System apps
dism.exe /Online /Add-ProvisioningPackage /PackagePath:%SystemDrive%\Windows\Provisioning\Packages\OEMApps.ppkg

cd \
\Windows\OEM\devcon.exe update \Windows\OEM\oempanel.inf ACPI\MSHW1004