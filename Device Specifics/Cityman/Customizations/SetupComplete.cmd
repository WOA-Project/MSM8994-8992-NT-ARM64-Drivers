@echo off
if exist \Windows\OEM\oobe.marker goto :eof
echo. > \Windows\OEM\oobe.marker
shutdown /r /t 0 /f