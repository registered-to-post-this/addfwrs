REM Adapted from https://github.com/charlesdh/addfwrs by Charles de Havilland
@echo off
@setlocal enableextensions
@cd /d "%~dp0"
cls
set /p RULENAME="Type rule name: "
ECHO Create in/out firewall rules to ALLOW *.exe files with the rulename of "%RULENAME%" ?
ECHO.
ECHO.

pause
Echo.
FOR /r %%G in ("*.exe") Do (@echo %%G
NETSH advfirewall firewall add rule name="%RULENAME%-%%~nxG" dir=in program="%%G" action="allow" enable="yes")
FOR /r %%G in ("*.exe") Do (@echo %%G
NETSH advfirewall firewall add rule name="%RULENAME%-%%~nxG" dir=out program="%%G" action="allow" enable="yes")
Echo.
Echo Done.
Echo.
Echo Batch complete. Press any key to exit.
pause > NUL
