@echo off
call \Windows\OEM\IHVSettingsSpecialize.cmd

\Windows\OEM\devcon.exe update \Windows\OEM\qcaud8994.inf AUDD\QCOM2451
call \Windows\OEM\IHVDriversSpecialize.cmd