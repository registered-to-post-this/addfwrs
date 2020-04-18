@echo off
@setlocal enableextensions
@cd /d "%~dp0"
FOR %%I IN (.) DO SET CurrentD=%%~nI%%~xI
set RULENAME=%CurrentD%
net session >nul 2>&1
    if %errorLevel% NEQ == 0 (
        goto :NotAdmin
    )
FOR /r %%G in ("*.exe") Do (@echo %%G
NETSH advfirewall firewall add rule name="%RULENAME%-%%~nxG" dir=in program="%%G" action="block" enable="yes")
FOR /r %%G in ("*.exe") Do (@echo %%G
NETSH advfirewall firewall add rule name="%RULENAME%-%%~nxG" dir=out program="%%G" action="block" enable="yes")
FOR /r %%G in ("*.dll") Do (@echo %%G
NETSH advfirewall firewall add rule name="%RULENAME%-%%~nxG" dir=in program="%%G" action="block" enable="yes")
FOR /r %%G in ("*.dll") Do (@echo %%G
NETSH advfirewall firewall add rule name="%RULENAME%-%%~nxG" dir=out program="%%G" action="block" enable="yes")
exit
:NotAdmin
echo You must run this batch file as administrator. No rules have been added.
pause
