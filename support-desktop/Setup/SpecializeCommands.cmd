@echo off
cmd.exe /c \Windows\OEM\IHVSettingsSpecialize.cmd

\Windows\OEM\devcon.exe update \Windows\OEM\qcaud8994.inf AUDD\QCOM2451
cmd.exe /c \Windows\OEM\IHVDriversSpecialize.cmd