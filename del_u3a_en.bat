@echo off
echo/
echo -------------------------------------------------------------------------
echo # This script deletes crashyltics and spyware from several companies    #
echo # from installation folders in Steam itself and from game folders       #
echo # to enhance own privacy and disallow hidden data theft                 #
echo # by GameIndustry.eu - 2020/11/27 - Version 2.2                         #
echo -------------------------------------------------------------------------
echo/

REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Fordere Adminrechte zum Entfernen der Dateien an
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------

:: Security question
echo/
echo This script deletes spyware and crashlytics from Steam folders and subfolders
echo/
echo Attention! Active program instances will be closed.
echo/
echo Do you want to continue? Press [Y]
echo If you want to cancel the process, press [N]. 
echo/
if exist "%SystemRoot%\System32\choice.exe" goto UseChoice

setlocal EnableExtensions EnableDelayedExpansion
:UseSetPrompt
set "UserChoice=N"
set /P "UserChoice=Are you sure [Y/N]? "
set "UserChoice=!UserChoice: =!"
if /I "!UserChoice!" == "N" endlocal & goto :EOF
if /I not "!UserChoice!" == "Y" goto UseSetPrompt
endlocal
goto Continue

:UseChoice
%SystemRoot%\System32\choice.exe /C YN /N /M "Are you sure [Y/N] "
if errorlevel 2 goto :EOF

:Continue

::Beende Tasks, sofern diese offen sind
echo/
echo Aktive Programminstanzen werden automatisch geschlossen...
echo/
::Wenn offen, beende Steam
taskkill /f /im steam.exe 2> nul
taskkill /f /im SteamService.exe 2> nul
taskkill /f /im steamwebhelper.exe 2> nul

::Delete Folder
IF EXIST "bin\cef\cef.win7\*.*" del "bin\cef\cef.win7\*.*" /q
IF EXIST "bin\cef\cef.win7\" RMDIR "bin\cef\cef.win7\" /s /q
IF EXIST "bin\cef\cef.win7x64\crash_reporter.cfg" del "bin\cef\cef.win7x64\crash_reporter.cfg" /q
::Delete files
IF EXIST "crashhandler64.dll" del "crashhandler64.dll" /f /q
IF EXIST "crashhandler.dll" del "crashhandler.dll" /f /q
IF EXIST "steamerrorreporter.exe" del "steamerrorreporter.exe" /f /q
IF EXIST "steamerrorreporter64.exe" del "steamerrorreporter64.exe" /f /q
IF EXIST "crashhandler64.dll" del "crashhandler64.dll" /f /q
IF EXIST "WriteMiniDump.exe" del "WriteMiniDump.exe" /f /q
echo/

set ORIGINAL_DIR=%CD%

set folder="steamapps\common"

for /f %%i in ('dir UnityCrashHandler*.exe /s /b 2^> nul ^| find "" /v /c') do set VAR=%%i
echo Es wurden %VAR% Datei/en aus den vorhandenen Spieleverzeichnissen gel”scht
IF EXIST "%folder%" (
    cd /d %folder%
    for /f "delims=" %%i in ('dir /a-d /s /b 2^> nul ^ UnityCrashHandler*.exe') do del "%%~i"
	for /f "delims=" %%i in ('dir /a-d /s /b 2^> nul ^ crashpad_handler.exe') do del "%%~i"
	for /f "delims=" %%i in ('dir /a-d /s /b 2^> nul ^ CrashSender1403.exe') do del "%%~i"
	for /f "delims=" %%i in ('dir /a-d /s /b 2^> nul ^ crashrpt_lang.ini') do del "%%~i"
	for /f "delims=" %%i in ('dir /a-d /s /b 2^> nul ^ CrashRpt1403.dll') do del "%%~i"
	for /f "delims=" %%i in ('dir /a-d /s /b 2^> nul ^ CrashRptProbe1403.dll') do del "%%~i"
	for /f "delims=" %%i in ('dir /a-d /s /b 2^> nul ^ CrashReporter.dll') do del "%%~i"
	for /f "delims=" %%i in ('dir /a-d /s /b 2^> nul ^ CrashReporter.exe') do del "%%~i"
	for /f "delims=" %%i in ('dir /a-d /s /b 2^> nul ^ CrashReporter.exe.config') do del "%%~i"
)
chdir /d %ORIGINAL_DIR%
@echo off 
pause