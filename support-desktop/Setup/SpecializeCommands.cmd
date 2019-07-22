@echo off
start /wait \Windows\OEM\IHVSettingsSpecialize.cmd

\Windows\OEM\devcon.exe update \Windows\OEM\qcaud8994.inf AUDD\QCOM2451
start /wait \Windows\OEM\IHVDriversSpecialize.cmd