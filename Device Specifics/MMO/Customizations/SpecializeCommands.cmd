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
dism.exe /Add-ProvisioningPackage /PackagePath:%SystemDrive%\Windows\Provisioning\Packages\OEMApps.ppkg

REM Temp mitigation for thermal issues regarding cellular (default is 3)
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\SmsRouter" /v Start /t REG_DWORD /d 4 /f

echo.
echo If you see any red warning dialog about driver signature, this is expected behavior.
echo Please accept any dialog you see so some post sysprep devices can be installed.
echo.

cd \
\Windows\OEM\devcon.exe update \Windows\OEM\oempanel.inf ACPI\MSHW1004
\Windows\OEM\devcon.exe update \Windows\OEM\qcmbb.wp8994.inf QCMS\QCOM0EA0
for /f "delims=*" %%f in ('dir /b /s \Windows\System32\DriverStore\FileRepository\qcxhcifilter*.inf') do \Windows\OEM\devcon.exe update %%f URS\QCOM24B6^&HOST